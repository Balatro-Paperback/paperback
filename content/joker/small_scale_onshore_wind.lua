SMODS.Joker {
  key = "small_scale_onshore_wind",
  config = {
    extra = {
      mult = 0,
      bonus = 2,
      card_req = 5
    }
  },
  rarity = 1,
  pos = { x = 16, y = 1 },
  atlas = 'jokers_atlas',
  cost = 6,
  unlocked = true,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = false,
  loc_vars = function(self, info_queue, card)
    return {
      vars = { card.ability.extra.bonus, card.ability.extra.card_req, card.ability.extra.mult }
    }
  end,

  calculate = function(self, card, context)
    if context.pre_discard and not context.hook and not context.blueprint_card then
      if #context.full_hand == card.ability.extra.card_req then
        card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.bonus
        return {
          message = localize('k_upgrade_ex'),
          colour = G.C.ORANGE
        }
      else
        card.ability.extra.mult = 0
        return {
          message = localize('k_reset'),
          colour = G.C.ORANGE
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
