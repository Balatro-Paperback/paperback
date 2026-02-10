SMODS.Joker {
  key = "showdown",
  config = {
    extra = {
      dollars = 1,
      odds = 2,
      suit1 = 'paperback_Stars',
      suit2 = 'paperback_Crowns'
    }
  },
  rarity = 1,
  pos = { x = 13, y = 6 },
  atlas = "jokers_atlas",
  cost = 5,
  unlocked = true,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,
  paperback = {
    requires_custom_suits = true,
    requires_spectrum_or_suit = true
  },

  paperback_credit = {
    coder = { 'dowfrin' }
  },

  in_pool = function(self, args)
    for _, v in ipairs(G.deck.cards) do
      if v:is_suit('paperback_Stars', true) or v:is_suit('paperback_Crowns', true) then return true end
    end
  end,

  loc_vars = function(self, info_queue, card)
    local numerator, denominator = PB_UTIL.chance_vars(card)

    return {
      vars = {
        localize(card.ability.extra.suit1, 'suits_plural'),
        localize(card.ability.extra.suit2, 'suits_plural'),
        numerator,
        denominator,
        card.ability.extra.dollars,
        colours = {
          G.C.SUITS[card.ability.extra.suit1] or G.C.PAPERBACK_STARS_LC,
          G.C.SUITS[card.ability.extra.suit2] or G.C.PAPERBACK_CROWNS_LC,
        }
      },

    }
  end,

  calculate = function(self, card, context)
    if context.cardarea == G.hand and context.individual and not context.end_of_round then
      if PB_UTIL.chance(card, "paperback_showdown_money") and context.other_card:is_suit(card.ability.extra.suit1) or context.other_card:is_suit(card.ability.extra.suit2) then
        return {
          dollars = card.ability.extra.dollars
        }
      end
    end
  end
}
