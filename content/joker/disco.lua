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
    if not context.blueprint and context.buying_card and to_big(G.GAME.dollars) <= to_big(card.ability.extra.dollars) and context.card ~= card then
      card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_mod
      return {
        message = localize('k_upgrade_ex'),
        colour = G.C.ORANGE
      }
    end
    if context.joker_main then
      return {
        mult = card.ability.extra.mult
      }
    end
  end,

  joker_display_def = function(JokerDisplay)
    return {
      text = {
        { text = "+" },
        { ref_table = "card.ability.extra", ref_value = "mult", retrigger_type = "mult" }
      },
      text_config = { colour = G.C.MULT },
    }
  end,
}
