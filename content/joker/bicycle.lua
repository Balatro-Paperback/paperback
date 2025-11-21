SMODS.Joker {
  key = "bicycle",
  config = {
    extra = {
      x_mult = 1.5
    }
  },
  rarity = 2,
  pos = { x = 2, y = 2 },
  atlas = "jokers_atlas",
  cost = 6,
  unlocked = true,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,
  soul_pos = nil,

  enhancement_gate = "m_wild",

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.m_wild
  end,

  calculate = function(self, card, context)
    if context.individual then
      if context.cardarea == G.play then
        if context.other_card.ability.name == 'Wild Card' then
          return {
            mult = context.other_card:get_chip_bonus(),
            card = card
          }
        end
      end
    end
  end,

  joker_display_def = function(JokerDisplay)
    return {
      text = {
        { text = "+",                              colour = G.C.MULT },
        { ref_table = "card.joker_display_values", ref_value = "mult", colour = G.C.MULT },
      },


      reminder_text = {
        {
          text = "(",
        },
        {
          ref_table = 'card.joker_display_values', ref_value = 'localized_text', colour = G.C.IMPORTANT
        },
        {
          text = ")",
        }
      },

      calc_function = function(card)
        local text, _, scoring_hand = JokerDisplay.evaluate_hand()
        local total_mult = 0

        for k, v in pairs(scoring_hand) do
          if v.ability.name == "Wild Card" then
            local triggers = JokerDisplay.calculate_card_triggers(v, scoring_hand)
            for _ = 1, triggers do
              total_mult = total_mult + v:get_chip_bonus()
            end
          end
        end

        card.joker_display_values.mult = total_mult
        card.joker_display_values.localized_text = localize { type = 'name_text', key = 'm_wild', set = 'Enhanced' }
      end
    }
  end,
}
