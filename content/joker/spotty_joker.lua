SMODS.Joker {
  key = "spotty_joker",
  config = {
    extra = {
      xmult_mod = 0.1,
      xmult_red = 0.1,
      xmult = 1,
    }
  },
  rarity = 2,
  pos = { x = 17, y = 9 },
  atlas = "jokers_atlas",
  cost = 3,
  unlocked = true,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = false,
  paperback = {
    requires_enhancements = true
  },
  enhancement_gate = 'm_paperback_domino',

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.m_paperback_domino

    return {
      vars = {
        card.ability.extra.xmult_mod,
        localize {
          type = 'name_text',
          set = 'Enhanced',
          key = 'm_paperback_domino'
        },
        card.ability.extra.xmult_red,
        card.ability.extra.xmult,
      }
    }
  end,

  calculate = function(self, card, context)
    if context.before and not context.blueprint then
      local upgraded
      for _, v in ipairs(context.scoring_hand) do
        if SMODS.has_enhancement(v, 'm_paperback_domino') then
          card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmult_mod
          upgraded = true
        end
      end
      if upgraded then
        return {
          message = localize('k_upgrade_ex'),
        }
      end
    end


    if context.joker_main then
      return {
        x_mult = card.ability.extra.xmult,
      }
    end
  end,
}
