SMODS.Joker {
  key = "milk_tea",
  config = {
    extra = {
      percent = 50,
      reduction = 10
    }
  },
  rarity = 2,
  pos = { x = 16, y = 3 },
  atlas = "jokers_atlas",
  cost = 6,
  blueprint_compat = true,
  eternal_compat = false,
  perishable_compat = true,
  pools = {
    Food = true
  },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.percent,
        card.ability.extra.reduction
      }
    }
  end,

  calculate = function(self, card, context)
    if context.joker_main then
      PB_UTIL.apply_plasma_effect(context.blueprint_card or card, false, card.ability.extra.percent / 100)
      return nil, true
    end

    if context.final_scoring_step then
      card.ability.extra.mult_gt_chip = mult > hand_chips
    end

    -- Apply reduction if final mult is greater than chips
    if context.after and not context.blueprint and card.ability.extra.mult_gt_chip then
      card.ability.extra.percent = card.ability.extra.percent - card.ability.extra.reduction
      card.ability.extra.mult_gt_chip = false

      if card.ability.extra.percent <= 0 then
        PB_UTIL.destroy_joker(card)

        return {
          message = localize('paperback_consumed_ex'),
          colour = G.C.MULT
        }
      else
        return {
          message = localize('paperback_reduced_ex'),
          colour = G.C.MULT
        }
      end
    end
  end,

  joker_display_def = function(JokerDisplay)
    return {
      text = {
        { ref_table = "card.ability.extra", ref_value = "percent" },
        { text = "%" },
      },
      text_config = { colour = G.C.PURPLE },
    }
  end,
}
