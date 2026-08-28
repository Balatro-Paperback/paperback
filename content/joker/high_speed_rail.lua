SMODS.Joker {
  key = "high_speed_rail",
  config = {
    extra = {
      mult = 0
    }
  },
  attributes = {
    'mult',
    'scaling',
    'sell_value'
  },
  rarity = 1,
  pos = { x = 15, y = 1 },
  atlas = "jokers_atlas",
  cost = 3,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = false,

  paperback_credit = {
    coder = { 'srockw' },
  },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.mult
      }
    }
  end,

  set_ability = function(self, card, initial, delay_sprites)
    if initial then
      G.E_MANAGER:add_event(Event {
        func = function()
          card.ability.extra.mult = card.cost or 3
          return true
        end
      })
    end
  end,

  calculate = function(self, card, context)
    if not context.blueprint and context.selling_card and context.card ~= card then
      if context.card.ability.set == 'Joker' and context.card.sell_cost ~= 0 then
        SMODS.scale_card(card, {
          ref_table = card.ability.extra,
          ref_value = 'mult',
          scalar_table = context.card,
          scalar_value = 'sell_cost',
          operation = function(ref_table, ref_value, initial, scaling)
            ref_table[ref_value] = math.max(0, initial - scaling)
          end,
          message_key = 'a_mult_minus',
          message_colour = G.C.MULT
        })
        return nil, true
      end
    end

    if not context.blueprint and context.buying_card and context.card ~= card then
      if context.card.ability.set == 'Joker' and context.card.cost ~= 0 then
        SMODS.scale_card(card, {
          ref_table = card.ability.extra,
          ref_value = 'mult',
          scalar_table = context.card,
          scalar_value = 'cost',
          message_key = 'a_mult',
          message_colour = G.C.MULT
        })
        return nil, true
      end
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
