SMODS.Joker {
  key = "forlorn",
  config = {
    extra = {
      suit = 'Spades',
    }
  },
  rarity = 1,
  pos = { x = 16, y = 10 },
  atlas = "jokers_atlas",
  cost = 6,
  unlocked = true,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.suit,
        colours = {
          G.C.SUITS[card.ability.extra.suit]
        }
      }
    }
  end,

  calculate = function(self, card, context)
    if context.after then
      local bad_suit = false
      local spade = false
      -- Check scoring hand for only Spades/suitless, at least 1 Spade/Wild
      for _, v in ipairs(context.scoring_hand) do
        bad_suit = bad_suit or PB_UTIL.is_non_suit(v, 'Spades')
        spade = spade or v:is_suit('Spades')
      end
      if not bad_suit and spade then
        local target = pseudorandom_element(G.hand.cards, pseudoseed('forlorn'))
        if target then
          SMODS.destroy_cards({ target })
          return {
            message = localize('paperback_forlorn_destruction'),
            colour = G.C.FILTER
          }
        end
      end
    end
  end
}
