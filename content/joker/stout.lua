SMODS.Joker {
  key = "stout",
  config = {
    extra = {
      amount = 30,
      suit = "Spades",
      remaining = 5,
      upgrade = "perma_bonus",
    }
  },
  attributes = {
    'chips',
    'modify_card',
    'perma_bonus',
    'suit',
    'spades',
    'food'
  },
  rarity = 2,
  pos = { x = 23, y = 8 },
  atlas = "jokers_atlas",
  cost = 6,
  unlocked = false,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = false,
  perishable_compat = false,
  soul_pos = nil,
  pools = {
    Food = true
  },

  paperback_credit = {
    coder = { 'dowfrin' }
  },

  locked_loc_vars = function (self, info_queue, card)
    return {vars = {5, localize(card.ability.extra.suit, 'suits_singular'),}}
  end,

  check_for_unlock = function (self, args)
    if args.type == 'paperback_suit_flushes' then
      if G.GAME.paperback.played_flushes['Spades'] and G.GAME.paperback.played_flushes['Spades'] >= 5 then
        return true
      end
    end
  end,

  calculate = PB_UTIL.suit_drink_calculate,

  loc_vars = PB_UTIL.suit_drink_loc_vars
}
