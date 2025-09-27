SMODS.Joker {
  key = "king_me",
  config = {
    extra = {
      rank_mod = 1,
      suit = 'paperback_Crowns'
    }
  },
  rarity = 1,
  pos = { x = 14, y = 2 },
  atlas = "jokers_atlas",
  cost = 6,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,
  paperback = {
    requires_crowns = true
  },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        localize(card.ability.extra.suit, 'suits_plural'),
        card.ability.extra.rank_mod,
        colours = {
          G.C.SUITS[card.ability.extra.suit] or G.C.PAPERBACK_CROWNS_LC
        }
      }
    }
  end,

  calculate = function(self, card, context)
    if context.after and context.main_eval then
      local cards = {}

      for _, v in ipairs(context.scoring_hand) do
        if v:is_suit(card.ability.extra.suit) and v:get_id() ~= 13 then
          cards[#cards + 1] = v
        end
      end

      if #cards > 0 then
        PB_UTIL.use_consumable_animation(context.blueprint_card or card, cards, function()
          for _, v in ipairs(cards) do
            assert(SMODS.modify_rank(v, card.ability.extra.rank_mod))
          end
        end)

        return nil, true
      end
    end
  end
}
