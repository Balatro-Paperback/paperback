SMODS.Joker {
  key = "magic_mushroom",
  config = {
    extra = {
      xmult = 3,
      a_xmult = 0.5,
      reset = 3
    }
  },
  attributes = {
    'red',
    'xmult',
    'food'
  },
  pools = {
    Food = true
  },
  rarity = 3,
  pos = { x = 6, y = 12 },
  atlas = "jokers_atlas",
  cost = 8,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,
  paperback_credit = {
    coder = { 'thermo' }
  },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.xmult,
        card.ability.extra.a_xmult
      }
    }
  end,
  calculate = function(self, card, context)
    if context.joker_main and card.ability.extra.xmult > 1 then
      return {
        xmult = card.ability.extra.xmult
      }
    end
    if context.after and not context.blueprint_card then
      if card.ability.extra.xmult - card.ability.extra.a_xmult >= 1 then
        SMODS.scale_card(card, {
          ref_table = card.ability.extra,
          ref_value = 'xmult',
          scalar_value = 'a_xmult',
          operation = '-',
          message_key = 'a_xmult_minus'
        })
      end
    end
    if context.blind_defeated and not context.blueprint_card then
      card.ability.extra.xmult = card.ability.extra.reset
      return {
        message = localize('k_reset')
      }
    end
  end
}
