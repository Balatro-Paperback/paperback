SMODS.Joker {
  key = "technology",
  config = {
    extra = {
      a_xmult = 0.5,
      enhancement = 'm_mult',
      xmult = 1,
      reset = 1
    }
  },
  attributes = {
    'red',
    'mult',
    'enhancements',
  },
  rarity = 2,
  pos = { x = 21, y = 11 },
  atlas = "jokers_atlas",
  cost = 8,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,
  paperback = {

  },
  paperback_credit = {
    coder = { 'thermo' }
  },

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.extra.enhancement]
    return {
      vars = {
        card.ability.extra.a_xmult,
        localize {
          type = 'name_text',
          set = 'Enhanced',
          key = card.ability.extra.enhancement
        },
        card.ability.extra.xmult
      }
    }
  end,

  calculate = function(self, card, context)
    if context.before and not context.blueprint_card then
      for _, scoring_card in ipairs(context.scoring_hand) do
        if SMODS.has_enhancement(scoring_card, "m_mult") then
          SMODS.scale_card(card, {
            ref_table = card.ability.extra,
            ref_value = 'xmult',
            scalar_value = 'a_xmult',
            no_message = true
          })
        end
      end
    end
    if context.joker_main and card.ability.extra.xmult > 1 then
      return {
        x_mult = card.ability.extra.xmult
      }
    end
    if context.end_of_round and context.main_eval and not context.blueprint_card then
      card.ability.extra.xmult = 1
      return {
        message = localize('k_reset')
      }
    end
  end
}
