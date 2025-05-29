SMODS.Joker {
  key = "boundary_of_death",
  config = {
    extra = {
      enhancement = "m_mult",
      odds = 4,
      mult = 50
    }
  },
  rarity = 3,
  pos = { x = 11, y = 2 },
  atlas = "jokers_atlas",
  cost = 8,
  unlocked = true,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,
  paperback = {
    requires_enhancements = true,
  },

  enhancement_gate = "m_mult",

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        localize {
          type = 'name_text',
          set = 'Enhanced',
          key = card.ability.extra.enhancement
        },
        G.GAME.probabilities.normal,
        card.ability.extra.odds,
        card.ability.extra.mult
      }
    }
  end,

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      local enhanced = SMODS.has_enhancement(context.other_card, card.ability.extra.enhancement)

      if enhanced and pseudorandom('boundary_of_death') < G.GAME.probabilities.normal / card.ability.extra.odds then
        return {
          mult = card.ability.extra.mult
        }
      end
    end
  end,

  joker_display_def = function(JokerDisplay)
    return {
      reminder_text = {
        { text = '(' },
        { ref_table = 'card.ability.extra', ref_value = 'enhancement', colour = G.C.IMPORTANT, scale = 0.35 },
        { text = ')' },
      },

      extra = {
        {
          { text = '(' },
          { ref_table = 'card.joker_display_values', ref_value = 'odds' },
          { text = ')' }
        },
      },
      extra_config = {
        colour = G.C.GREEN,
        scale = 0.3
      },

      calc_function = function(card)
        card.joker_display_values.odds = localize { type = 'variable', key = 'jdis_odds', vars = { (G.GAME and G.GAME.probabilities.normal or 1), card.ability.extra.odds } }
      end
    }
  end
}
