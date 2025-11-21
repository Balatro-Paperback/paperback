SMODS.Joker {
  key = "blue_marble",
  config = {
    extra = {
      mult = 0,
      increment = 2,
    }
  },
  rarity = 1,
  pos = { x = 11, y = 1 },
  atlas = "jokers_atlas",
  cost = 3,
  unlocked = true,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = false,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.increment,
        card.ability.extra.mult
      }
    }
  end,

  calculate = function(self, card, context)
    if context.using_consumeable and context.consumeable.ability.set == "Planet" then
      card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.increment
      return {
        message = localize('k_upgrade_ex')
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
      text_config = { colour = G.C.MULT }
    }
  end
}
