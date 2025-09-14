SMODS.Joker {
  key = "disco",
  blueprint_compat = true,
  rarity = 2,
  cost = 7,
  pos = { x = 20, y = 3 },
  atlas = "jokers_atlas",
  perishable_compat = false,
  config = { extra = { mult_mod = 2, dollars = 25, mult = 0 } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.mult_mod, card.ability.extra.dollars, card.ability.extra.mult } }
  end,
  calculate = function(self, card, context)
    if context.buying_card and G.GAME.dollars <= to_number(card.ability.extra.dollars) then     -- See note about Talisman compatibility on the wiki
      card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_mod
      return {
        message = localize('k_upgrade_ex'),
        colour = G.C.ORANGE
      }
    end
  end,
}
