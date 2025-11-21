SMODS.Joker {
  key = "wish_you_were_here",
  config = {
    extra = {
      sv_gain = 1,
      mult_mod = 2
    }
  },
  rarity = 2,
  pos = { x = 4, y = 0 },
  atlas = "jokers_atlas",
  cost = 6,
  unlocked = true,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = false,
  soul_pos = nil,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.mult_mod,
        card.ability.extra.sv_gain,
        card.ability.extra.mult_mod * card.sell_cost
      }
    }
  end,

  calculate = function(self, card, context)
    if context.joker_main then
      local mult = card.ability.extra.mult_mod * card.sell_cost

      return {
        mult = mult,
      }
    end

    -- Increase the sell value at end of round
    if context.end_of_round and not context.blueprint and context.main_eval then
      PB_UTIL.modify_sell_value(card, 1)

      return {
        message = localize('k_val_up'),
        colour = G.C.MONEY
      }
    end
  end,

  joker_display_def = function(JokerDisplay)
    return {
      text = {
        { text = "+" },
        { ref_table = "card.joker_display_values", ref_value = "mult", retrigger_type = "mult" }
      },
      text_config = { colour = G.C.MULT },
      reminder_text = {
        { text = "(" },
        { text = "$", colour = G.C.GOLD },
        { ref_table = "card", ref_value = "sell_cost", colour = G.C.GOLD },
        { text = ")" },
      },
      reminder_text_config = { scale = 0.35 },
      calc_function = function(card)
        card.joker_display_values.mult = card.ability.extra.mult_mod * card.sell_cost
      end
    }
  end,
}
