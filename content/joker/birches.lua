SMODS.Joker {
  key = "birches",
  config = {
    extra = {
      xMult = 1.075,
      xMult_gain = 0.075,
      xMult_base = 1.075,
      suit = "paperback_Stars",
    }
  },
  rarity = 1,
  pos = { x = 2, y = 10 },
  atlas = "jokers_atlas",
  cost = 6,
  unlocked = true,
  discovered = true,
  blueprint_compat = true,
  eternal_compat = true,
  paperback = {
    requires_stars = true,
  },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        localize(card.ability.extra.suit, 'suits_plural'),
        tostring(card.ability.extra.xMult_base),
        tostring(card.ability.extra.xMult_gain),
        localize(card.ability.extra.suit, 'suits_singular')
      }
    }
  end,

  calculate = function(self, card, context)
    return PB_UTIL.panorama_logic(card, context)
  end,

  joker_display_def = function(JokerDisplay)
    return {
      text = {
        {
          border_nodes = {
            { text = "X" },
            { ref_table = "card.joker_display_values", ref_value = "xMult", retrigger_type = "exp" },
          }
        }
      },

      reminder_text = {
        { text = "(" },
        { ref_table = "card.joker_display_values", ref_value = "localized_text", colour = G.C.SUITS["paperback_Stars"] },
        { text = ")" },
      },

      calc_function = function(card)
        PB_UTIL.panorama_joker_display_logic(card, JokerDisplay)
      end,
    }
  end,
}
