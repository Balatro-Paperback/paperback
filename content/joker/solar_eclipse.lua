SMODS.Joker {
  key = "solar_eclipse",
  config = {
    extra = {
      suit = 'paperback_Crowns'
    }
  },
  rarity = 3,
  pos = { x = 11, y = 4 },
  atlas = "jokers_atlas",
  cost = 6,
  blueprint_compat = false,
  eternal_compat = true,
  perishable_compat = true,
  paperback = {
    requires_custom_suits = true,
  },

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = PB_UTIL.suit_tooltip('light')

    return {
      vars = {
        localize(card.ability.extra.suit, 'suits_plural'),
        colours = {
          G.C.SUITS[card.ability.extra.suit] or G.C.PAPERBACK_CROWNS_LC
        }
      }
    }
  end,

  calculate = function(self, card, context)
    if not context.blueprint and context.after and context.main_eval then
      local cards = {}

      for _, v in ipairs(context.scoring_hand) do
        if PB_UTIL.is_suit(v, 'light') then
          cards[#cards + 1] = v
        end
      end

      if #cards > 0 then
        PB_UTIL.use_consumable_animation(card, cards, function()
          for _, v in ipairs(cards) do
            assert(SMODS.change_base(v, card.ability.extra.suit))
          end
        end)

        return nil, true
      end
    end
  end
}
