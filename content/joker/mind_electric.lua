SMODS.Joker {
  key = "mind_electric",
  config = {
    extra = {
      change = 0.2,
      xm = 1
    }
  },
  attributes = {
    'xmult',
    'scaling',
    'destroy_card',
    'enhancements',
    'red'
  },
  paperback_credit = {
    coder = { 'thermo' }
  },
  rarity = 3,
  pos = { x = 4, y = 11 },
  atlas = "jokers_atlas",
  cost = 3,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = false,
  enhancement_gate = "m_mult",
  unlocked = false,

  check_for_unlock = function (self, args)
    return (G.GAME.paperback.destroyed_cards.enhancements["m_mult"] or false)
  end,

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.m_mult
    return {
      vars = {
        card.ability.extra.change, card.ability.extra.xm,
        localize {
          type = 'name_text',
          set = 'Enhanced',
          key = 'm_mult'
        },
      }
    }
  end,

  calculate = function(self, card, context)
    if context.joker_main and card.ability.extra.xm > 1 then
      return {
        xmult = card.ability.extra.xm
      }
    end
    if context.destroy_card and context.cardarea == G.play and not context.blueprint then
      if SMODS.has_enhancement(context.destroy_card, "m_mult") then
        SMODS.scale_card(card, {
          ref_table = card.ability.extra,
          ref_value = 'xm',
          scalar_value = 'change',
          message_key = 'a_xmult',
          message_colour = G.C.MULT
        })
        return { remove = true }
      end
    end
  end
}
