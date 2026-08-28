SMODS.Joker {
  key = "the_girl_from_024",
  config = {
    extra = {
      a_xmult = 0.2,
      xmult = 1
    }
  },
  attributes = {
    'xmult',
    'scaling',
    'queens'
  },
  rarity = 2,
  pos = { x = 19, y = 12 },
  soul_pos = { x = 20, y = 12 },
  atlas = "jokers_atlas",
  cost = 7,
  unlocked = true,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = false,
  paperback_credit = {
    coder = { 'dowfrin' },
  },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.a_xmult,
        card.ability.extra.xmult
      }
    }
  end,

  calculate = function(self, card, context)
    if not context.blueprint and context.individual and context.cardarea == G.hand and context.end_of_round and context.other_card then
      if PB_UTIL.is_rank(context.other_card, 12) and not context.other_card.debuff then
        SMODS.scale_card(card, {
          ref_table = card.ability.extra,
          ref_value = 'xmult',
          scalar_value = 'a_xmult',
          scaling_message = {
            message = localize('k_upgrade_ex'),
            message_card = card,
            juice_card = context.other_card
          }
        })
        return nil, true
      end
    end

    if context.joker_main then
      return {
        xmult = card.ability.extra.xmult
      }
    end
  end,

  joker_display_def = function(JokerDisplay)
    return {
      text = {
        { text = 'X' },
        { ref_table = 'card.ability.extra', ref_value = 'xmult', colour = G.C.MULT, retrigger_type = "exp" },
      },
    }
  end
}
