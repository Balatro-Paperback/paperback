SMODS.Joker {
  key = "satellite_array",
  blueprint_compat = true,
  rarity = 2,
  cost = 7,
  pos = { x = 20, y = 1 },
  atlas = "jokers_atlas",
  perishable_compat = false,
  config = { extra = { chips_mod = 20, chips_rem = 5, chips = 0 } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.chips_mod, card.ability.extra.chips_rem, card.ability.extra.chips } }
  end,
  calculate = function(self, card, context)
    if context.joker_main and card.ability.extra.chips > 0 then
      return {
        chips = card.ability.extra.chips
      }
    end
    if context.final_scoring_step and card.ability.extra.chips > 0 then
      card.ability.extra.chips = card.ability.extra.chips - card.ability.extra.chips_rem
      return {
        message = localize('paperback_downgrade_ex'),
        colour = G.C.ORANGE
      }
    end
    if context.using_consumeable and not context.blueprint and context.consumeable.ability.set == 'Planet' then
      card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chips_mod
      return {
        message = localize { type = 'variable', key = 'a_chips', vars = { card.ability.extra.chips } }
      }
    end
  end,
}
