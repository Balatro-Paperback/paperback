SMODS.Joker {
  key = 'jestrica',
  config = {
    extra = {
      mult = 0,
      increase = 1,
      scored = false,
      rank = "8"
    }
  },
  rarity = 1,
  pos = { x = 7, y = 5 },
  atlas = 'jokers_atlas',
  cost = 5,
  unlocked = true,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = false,

  paperback_credit = {
    coder = { 'srockw' },
  },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.increase,
        card.ability.extra.mult,
        card.ability.extra.rank
      }
    }
  end,

  calculate = function(self, card, context)
    -- Give mult when scored and copied
    if context.joker_main and context.cardarea == G.jokers then
      return {
        mult = card.ability.extra.mult,
      }
    end

    -- Upgrade this Joker for every scored 8
    if not context.blueprint and context.individual and context.cardarea == G.play then
      if PB_UTIL.is_rank(context.other_card, card.ability.extra.rank) then
        card.ability.extra.scored = true
        card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.increase

        return {
          extra = {
            focus = card,
            message = localize('k_upgrade_ex'),
            colour = G.C.MULT,
          },
          card = card
        }
      end
    end

    -- Check if this Joker's mult should reset depending on if an 8 was scored this round
    if not context.blueprint and context.end_of_round and context.main_eval then
      if not card.ability.extra.scored and card.ability.extra.mult > 0 then
        card.ability.extra.mult = 0

        return {
          message = localize('k_reset'),
          colour = G.C.MULT
        }
      end

      -- Reset the scored flag after round ends
      card.ability.extra.scored = false
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
