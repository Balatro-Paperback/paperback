SMODS.Joker {
  key = "planchette",
  config = {
    extra = {
      xmult = 1,
      xmult_gain = 0.25,
    },
  },
  attributes = {
    'xmult',
    'scaling',
    'spectral',
    'consumable'
  },
  rarity = 2,
  pos = { x = 25, y = 10 },
  atlas = "jokers_atlas",
  cost = 6,
  unlocked = false,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = false,
  soul_pos = nil,

  paperback_credit = {
    coder = { 'vitellary' }
  },

  check_for_unlock = function(self, args)
    return PB_UTIL.count_used_consumables('Spectral', true) >= 5
  end,

  locked_loc_vars = function(self, info_queue, card)
    return {
      vars = {
        5,
        localize('k_spectral')
      }
    }
  end,

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.xmult_gain, card.ability.extra.xmult } }
  end,

  calculate = function(self, card, context)
    if not context.blueprint and context.using_consumeable and context.consumeable.ability.set == 'Spectral' then
      SMODS.scale_card(card, {
        ref_table = card.ability.extra,
        ref_value = 'xmult',
        scalar_value = 'xmult_gain',
        message_colour = G.C.MULT
      })
      return nil, true
    end
    if context.joker_main then
      return { xmult = card.ability.extra.xmult }
    end
  end
}
