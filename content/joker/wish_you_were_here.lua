SMODS.Joker {
  key = "wish_you_were_here",
  config = {
    extra = {
      sv_gain = 1,
      mult_mod = 2
    }
  },
  attributes = {
    'mult',
    'sell_value',
    'scaling'
  },
  rarity = 2,
  pos = { x = 4, y = 0 },
  atlas = "jokers_atlas",
  cost = 6,
  unlocked = false,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = false,
  soul_pos = nil,

  paperback_credit = {
    coder = { 'oppositewolf' }
  },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.mult_mod,
        card.ability.extra.sv_gain,
        card.ability.extra.mult_mod * (card.sell_cost or 0)
      }
    }
  end,

  check_for_unlock = function(self, args)
    if args.type == 'paperback_wywh_sell_value' then
      return true
    end
  end,

  locked_loc_vars = function(self, info_queue, back)
      return {
        vars = {
          50
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
      SMODS.scale_card(card, {
        ref_table = card.ability,
        ref_value = 'extra_value',
        scalar_table = card.ability.extra,
        scalar_value = 'sv_gain',
        scaling_message = {
          message = localize('k_val_up'),
          colour = G.C.MONEY
        }
      })
      card:set_cost()
      return nil, true
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
local set_sell_value_ref = Card.set_sell_value
function Card:set_sell_value()
  set_sell_value_ref(self)
  if self.sell_cost >= 50 then
    check_for_unlock({ type = 'paperback_wywh_sell_value' })
  end
end