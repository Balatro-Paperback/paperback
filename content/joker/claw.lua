SMODS.Joker {
  key = "claw",
  config = {
    extra = {
      mult = 3,
      mult_inc = 2,
      rank = "3",
      starting_mult = 3
    }
  },
  rarity = 1,
  pos = { x = 10, y = 1 },
  atlas = "jokers_atlas",
  cost = 3,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        localize(card.ability.extra.rank, 'ranks'),
        card.ability.extra.mult_inc,
        card.ability.extra.mult,
        card.ability.extra.starting_mult
      }
    }
  end,

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      if PB_UTIL.is_rank(context.other_card, card.ability.extra.rank) then
        local mult = card.ability.extra.mult

        if not context.blueprint then
          card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_inc
        end

        return {
          mult = mult
        }
      end
    end

    if context.end_of_round and not context.blueprint and context.main_eval then
      card.ability.extra.mult = card.ability.extra.starting_mult

      return {
        message = localize('k_reset')
      }
    end
  end,

  joker_display_def = function(JokerDisplay)
    return {
      text = {
        { text = "+" },
        { ref_table = "card.joker_display_values", ref_value = "mult" }
      },
      text_config = { colour = G.C.MULT },
      reminder_text = {
        { text = "(" },
        { ref_table = "card.joker_display_values", ref_value = "localized_text" },
        { text = ")" },
      },
      calc_function = function(card)
        local count = 0
        local _, _, scoring_hand = JokerDisplay.evaluate_hand()
        for _, scoring_card in pairs(scoring_hand) do
          if PB_UTIL.is_rank(scoring_card, card.ability.extra.rank) then
            count = count +
                JokerDisplay.calculate_card_triggers(scoring_card, scoring_hand)
          end
        end
        count = count * JokerDisplay.calculate_joker_triggers(card)

        card.joker_display_values.mult =
            count * card.ability.extra.mult
            + count * (count - 1) / 2 * card.ability.extra.mult_inc

        card.joker_display_values.localized_text = localize(card.ability.extra.rank, 'ranks')
      end
    }
  end,
}
