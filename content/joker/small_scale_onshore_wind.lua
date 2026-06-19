SMODS.Joker {
  key = "small_scale_onshore_wind",
  config = {
    extra = {
      mult = 0,
      bonus = 2,
      card_req = 5
    }
  },
  attributes = {
    'mult',
    'scaling',
    'reset',
    'discard'
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

  paperback_credit = {
    coder = { 'thermo' }
  },

  loc_vars = function(self, info_queue, card)
    return {
      vars = { card.ability.extra.bonus, card.ability.extra.card_req, card.ability.extra.mult }
    }
  end,

  calculate = function(self, card, context)
    if context.pre_discard and not context.hook and not context.blueprint_card then
      if #context.full_hand == card.ability.extra.card_req then
        SMODS.scale_card(card, {
          ref_table = card.ability.extra,
          ref_value = 'mult',
          scalar_value = 'bonus'
        })
        return nil, true
      else
        SMODS.reset_card(card, {
          ref_table = card.ability.extra,
          ref_value = 'mult',
          reset_value = 0
        })
        return nil, true
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
