SMODS.Joker {
  key = 'meeple',
  config = {
    extra = {
      discards_given = 1,
      odds = 2,
    }
  },
  rarity = 1,
  pos = { x = 8, y = 5 },
  atlas = 'jokers_atlas',
  cost = 6,
  unlocked = true,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,

  loc_vars = function(self, info_queue, card)
    local numerator, denominator = PB_UTIL.chance_vars(card)

    return {
      vars = {
        numerator,
        denominator,
        card.ability.extra.discards_given,
      }
    }
  end,

  calculate = function(self, card, context)
    if context.before and context.main_eval then
      for _, v in ipairs(context.scoring_hand) do
        if v:is_face() and PB_UTIL.chance(card, 'meeple') then
          ease_discard(card.ability.extra.discards_given)

          return {
            message = localize {
              type = 'variable',
              key = 'paperback_a_discards',
              vars = { card.ability.extra.discards_given }
            },
            colour = G.C.MULT,
            card = card
          }
        end
      end
    end
  end,
}
