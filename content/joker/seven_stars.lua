SMODS.Joker {
  key = "seven_stars",
  config = {
    extra = {
      suit = "paperback_Stars"
    }
  },
  attributes = {
    'suit',
    'stars',
    'rettrigger'
  },
  rarity = 3,
  pos = { x = 2, y = 13 },
  atlas = "jokers_atlas",
  cost = 8,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,
  paperback = {
    requires_stars = true
  },
  paperback_credit = {
    coder = { 'thermo' }
  },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        localize(card.ability.extra.suit, 'suits_plural')
      }
    }
  end,

  calculate = function(self, card, context)
    if context.repetition and context.cardarea == G.play and context.other_card:is_suit(card.ability.extra.suit) then
      return {
        repetitions = 1
      }
    end
  end
}
