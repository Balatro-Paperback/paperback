SMODS.Joker {
  key = "prism",
  config = {
    extra = {
      hand = 'Flush'
    }
  },
  attributes = {
    'modify_card',
    'hand_type'
  },
  rarity = 2,
  pos = { x = 11, y = 6 },
  atlas = "jokers_atlas",
  cost = 6,
  blueprint_compat = false,
  eternal_compat = true,
  perishable_compat = true,
  paperback = {
    requires_custom_suits = true,
    requires_spectrum_or_suit = true
  },
  unlocked = false,

  paperback_credit = {
    coder = { 'srockw' }
  },

  check_for_unlock = function(self, args)
    if G.GAME.round >= 1 then
      for _, v in ipairs(G.playing_cards or {}) do
        if SMODS.has_enhancement(v, "m_glass") and (v.base.suit == ("paperback_Stars") or v.base.suit == ("paperback_Crowns")) then
          return true
        end
      end
    end
  end,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        localize(card.ability.extra.hand, 'poker_hands')
      }
    }
  end,

  calculate = function(self, card, context)
    if not context.blueprint and context.after and context.main_eval and next(context.poker_hands[card.ability.extra.hand]) then
      local played_suits = {}

      for _, v in ipairs(context.scoring_hand) do
        if not SMODS.has_no_suit(v) then
          played_suits[v.base.suit] = true
        end
      end

      local available_suits = {}

      for k, v in pairs(SMODS.Suits) do
        if not played_suits[k] then
          available_suits[k] = v
        end
      end

      PB_UTIL.use_consumable_animation(card, context.scoring_hand, function()
        for _, v in ipairs(context.scoring_hand) do
          local _, suit = pseudorandom_element(available_suits, pseudoseed("prism"), {
            paperback = {
              include_stars = true,
              include_crowns = true
            }
          })

          if suit then
            available_suits[suit] = nil
            assert(SMODS.change_base(v, suit))
          end
        end
      end)

      return nil, true
    end
  end
}
