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
  attributes = {
    'mult',
    'rank',
    'three',
    'scaling',
    'reset'
  },
  rarity = 1,
  pos = { x = 10, y = 1 },
  atlas = "jokers_atlas",
  cost = 3,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,
  paperback_credit = {
    coder = { 'srockw' },
  },
  unlocked = false,

  locked_loc_vars = function (self, info_queue, card)
    return { vars = { 5 }}
  end,
  
  check_for_unlock = function (self, args)
    return G.GAME.paperback.round.ranks_scored and (G.GAME.paperback.round.ranks_scored[3] or 0) >= 5
  end,

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
          SMODS.scale_card(card, {
            ref_table = card.ability.extra,
            ref_value = 'mult',
            scalar_value = 'mult_inc',
            no_message = true
          })
        end

        return {
          mult = mult
        }
      end
    end

    if context.end_of_round and not context.blueprint and context.main_eval then
      SMODS.reset_card(card, {
        ref_table = card.ability.extra,
        ref_value = 'mult',
        reset_value = card.ability.extra.starting_mult
      })
      return nil, true
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
