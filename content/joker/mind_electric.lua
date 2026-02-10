SMODS.Joker {
  key = "mind_electric",
  config = {
    extra = {
      change = 0.2,
      xm = 1
    }
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
  ehancement_gate = "m_mult",

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
        card.ability.extra.xm = card.ability.extra.xm + card.ability.extra.change
        return {
          message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.xm } },
          remove = true
        }
      end
    end
  end,
  -- Thanks vremade :3
  in_pool = function(self, args)
    for _, playing_card in ipairs(G.playing_cards or {}) do
      if SMODS.has_enhancement(playing_card, 'm_mult') then
        return true
      end
    end
    return false
  end
}
