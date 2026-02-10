SMODS.Joker {
  key = 'emergency_broadcast',
  config = {
    extra = {
      a_mult = 5,
      a_chips = 8,
    }
  },
  rarity = 1,
  pos = { x = 9, y = 4 },
  atlas = 'jokers_atlas',
  cost = 6,
  unlocked = true,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,
  soul_pos = nil,
  paperback_credit = {
    coder = { 'oppositewolf' },
  },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.a_mult,
        card.ability.extra.a_chips,
      }
    }
  end,

  calculate = function(self, card, context)
    if not card.debuff then
      if context.individual and context.cardarea == G.play then
        if PB_UTIL.is_rank(context.other_card, "5") or PB_UTIL.is_rank(context.other_card, "8") then
          return {
            mult = card.ability.extra.a_mult,
            chips = card.ability.extra.a_chips,
            card = card
          }
        end
      end
    end
  end,

  joker_display_def = function(JokerDisplay)
    return {
      text = {
        { text = "+", colour = G.C.CHIPS },
        { ref_table = "card.joker_display_values", ref_value = "chips", colour = G.C.CHIPS, retrigger_type = "mult" },
        { text = " +", colour = G.C.MULT },
        { ref_table = "card.joker_display_values", ref_value = "mult", colour = G.C.MULT, retrigger_type = "mult" }
      },
      reminder_text = {
        { text = "(5,8)" }
      },
      calc_function = function(card)
        local chips, mult = 0, 0
        local _, _, scoring_hand = JokerDisplay.evaluate_hand()
        for _, scoring_card in pairs(scoring_hand) do
          if scoring_card:get_id() == 5 or scoring_card:get_id() == 8 then
            local retriggers = JokerDisplay.calculate_card_triggers(scoring_card, scoring_hand)
            chips = chips + card.ability.extra.a_chips * retriggers
            mult = mult + card.ability.extra.a_mult * retriggers
          end
        end
        card.joker_display_values.chips = chips
        card.joker_display_values.mult = mult
      end
    }
  end,
}
