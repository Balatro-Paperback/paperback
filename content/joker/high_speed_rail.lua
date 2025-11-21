SMODS.Joker {
  key = "high_speed_rail",
  config = {
    extra = {
      mult = 0
    }
  },
  rarity = 1,
  pos = { x = 15, y = 1 },
  atlas = "jokers_atlas",
  cost = 3,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = false,

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
        card.ability.extra.mult = math.max(0, card.ability.extra.mult - context.card.sell_cost)

        return {
          message = localize {
            type = 'variable',
            key = 'a_mult_minus',
            vars = { context.card.sell_cost }
          },
          colour = G.C.MULT
        }
      end
    end

    if not context.blueprint and context.buying_card and context.card ~= card then
      if context.card.ability.set == 'Joker' and context.card.cost ~= 0 then
        card.ability.extra.mult = card.ability.extra.mult + context.card.cost

        return {
          message = localize {
            type = 'variable',
            key = 'a_mult',
            vars = { context.card.cost }
          },
          colour = G.C.MULT
        }
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
