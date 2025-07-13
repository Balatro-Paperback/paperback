SMODS.Joker {
  key = "crispy_taco",
  config = {
    extra = {
      x_chips = 3,
      odds = 6
    }
  },
  rarity = 2,
  pos = { x = 1, y = 2 },
  atlas = "jokers_atlas",
  cost = 6,
  unlocked = true,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = false,
  soul_pos = nil,

  no_pool_flag = "soft_taco_can_spawn",
  pools = {
    Food = true
  },

  loc_vars = function(self, info_queue, card)
    local numerator, denominator = PB_UTIL.chance_vars(card)

    return {
      vars = {
        card.ability.extra.x_chips,
        numerator,
        denominator
      }
    }
  end,

  calculate = function(self, card, context)
    -- Scores the xChips
    if context.joker_main then
      return {
        x_chips = card.ability.extra.x_chips
      }
    end

    -- Checks if Joker should be destroyed at the end of the round
    if context.end_of_round and not context.blueprint and context.main_eval then
      if PB_UTIL.chance(card, 'Crispy Taco') then
        PB_UTIL.destroy_joker(card, function()
          -- Allows Soft Taco to spawn, prevents Crispy Taco from spawning
          G.GAME.pool_flags.soft_taco_can_spawn = true
        end)

        return {
          message = localize('k_eaten_ex'),
          colour = G.C.CHIPS,
          card = card
        }
      else
        return {
          message = localize('k_safe_ex'),
          colour = G.C.CHIPS,
          card = card
        }
      end
    end
  end,

  joker_display_def = function(JokerDisplay)
    return {
      text = {
        {
          border_nodes = {
            { text = 'X' },
            { ref_table = 'card.ability.extra', ref_value = 'x_chips' },
          },
          border_colour = G.C.CHIPS,
        },
      },

      extra = {
        {
          { text = '(' },
          { ref_table = 'card.joker_display_values', ref_value = 'odds' },
          { text = ')' },
        },
      },
      extra_config = {
        colour = G.C.GREEN,
        scale = 0.3,
      },

      calc_function = function(card)
        card.joker_display_values.odds = localize { type = 'variable', key = 'jdis_odds', vars = { PB_UTIL.chance_vars(card) } }
      end,
    }
  end
}
