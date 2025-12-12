SMODS.Joker {
  key = "black_star",
  config = {
    extra = {
      suit_conv = 'paperback_Stars'
    }
  },
  rarity = 3,
  pos = { x = 14, y = 3 },
  atlas = "jokers_atlas",
  cost = 6,
  blueprint_compat = false,
  eternal_compat = true,
  perishable_compat = true,
  paperback = {
    requires_custom_suits = true
  },

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = PB_UTIL.suit_tooltip('dark')

    return {
      vars = {
        localize(card.ability.extra.suit_conv, 'suits_plural'),
        colours = {
          G.C.SUITS[card.ability.extra.suit_conv] or G.C.PAPERBACK_STARS_LC
        }
      }
    }
  end,

  calculate = function(self, card, context)
    if not context.blueprint and context.after and context.main_eval then
      local cards = {}

      for _, v in ipairs(context.scoring_hand) do
        if PB_UTIL.is_suit(v, 'dark') then
          cards[#cards + 1] = v
        end
      end

      if #cards > 0 then
        PB_UTIL.use_consumable_animation(card, cards, function()
          for _, v in ipairs(cards) do
            assert(SMODS.change_base(v, card.ability.extra.suit_conv))
          end
        end)
      end
    end
  end
}
