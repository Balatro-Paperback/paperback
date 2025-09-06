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
      local destroy = true
      -- Check scoring hand for only Spades
      for _, v in ipairs(context.scoring_hand) do
        if not v:is_suit(card.ability.extra.suit) then
          destroy = false
        end
      end
      if destroy then
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
