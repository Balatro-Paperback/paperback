SMODS.Joker {
  key = "thornring",
  config = {
    extra = {
      remaining = {},
      current = 'High Card',
      suit = 'Hearts'
    }
  },
  attributes = {
    'red',
    'spectral',
    'hearts',
    'destroy_card',
    'generation'
  },
  rarity = 3,
  pos = { x = 0, y = 13 },
  atlas = "jokers_atlas",
  cost = 7,
  unlocked = false,

  blueprint_compat = false,
  eternal_compat = true,
  perishable_compat = true,

  paperback = {

  },
  paperback_credit = {
    coder = { 'dowfrin' }
  },

  check_for_unlock = function(self, args)
    if args.type == 'modify_deck' and next(G.playing_cards) then
      for k, v in pairs(G.playing_cards) do
        if not v:is_suit('Hearts') then return false end
      end
      return true
    end
  end,

  loc_vars = function(self, info_queue, card)
    if card.ability.extra.current then
      return {
        vars = {
          card.ability.extra.current and localize(card.ability.extra.current, 'poker_hands') or
          "you shouldn't be able to see this",
          PB_UTIL.count_entries(card.ability.extra.remaining) + 1,
        }
      }
    else
      return {
        vars = {
          localize(card.ability.extra.suit, 'suits_plural'),
          colours = { G.C.SUITS[card.ability.extra.suit] },
        },
        -- alt desc
        key = 'j_paperback_thornring_weird'
      }
    end
  end,

  calculate = function(self, card, context)
    if not context.blueprint and context.destroy_card and (context.cardarea == G.play or context.cardarea == 'unscored') and ((context.scoring_name == card.ability.extra.current) or (not next(card.ability.extra.remaining) and context.destroy_card:is_suit(card.ability.extra.suit))) then
      if context.destroy_card == context.full_hand[#context.full_hand] then
        if card.ability.extra.current then
          PB_UTIL.thornring_proceed(card)
          PB_UTIL.try_spawn_card { set = 'Spectral' }
        end

        return {
          remove = true,
          message = localize(card.ability.extra.current and 'paperback_proceed_ex' or 'paperback_destroyed_ex'),
          colour = G.C.RED,
        }
      else
        return {
          remove = true,
        }
      end
    end
  end,

  set_ability = function(self, card, initial, delay_sprites)
    local _hands = {}
    for k, _ in pairs(G.GAME.hands) do
      if SMODS.is_poker_hand_visible(k) then _hands[#_hands + 1] = k end
    end

    card.ability.extra.remaining = _hands

    PB_UTIL.thornring_proceed(card)
  end
}

PB_UTIL.thornring_proceed = function(card)
  local _i = pseudorandom('thornring_proceed', 1, #card.ability.extra.remaining)
  card.ability.extra.current = table.remove(card.ability.extra.remaining, _i)
end
