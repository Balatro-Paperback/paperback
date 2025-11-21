SMODS.Joker {
  key = "unionized_labor",
  blueprint_compat = true,
  rarity = 2,
  cost = 7,
  pos = { x = 20, y = 5 },
  atlas = "jokers_atlas",
  perishable_compat = false,
  config = { extra = { dollars = 25 } },
  loc_vars = function(self, info_queue, card)
    local n, d = PB_UTIL.chance_vars(nil, nil, 1, 3) -- example
    if not G.jokers then
      -- outside game, manually modify
      n = n * 3
    end
    return { vars = { card.ability.extra.dollars, n, d } }
  end,
  calculate = function(self, card, context)
    if context.mod_probability and not context.blueprint then
      if to_big(G.GAME.dollars) <= to_big(card.ability.extra.dollars) then
        return {
          numerator = context.numerator * 3
        }
      else
        return {
          denominator = context.denominator * 2
        }
      end
    end
  end
}
