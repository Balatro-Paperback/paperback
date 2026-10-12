SMODS.Joker {
  key = "watermelon",
  config = {
    extra = {
      a_xmult = 0.1,
      x_mult = 1,
    }
  },
  attributes = {
    'xmult',
    'scaling',
    'red'
  },
  rarity = 2,
  pos = { x = 12, y = 10 },
  atlas = "jokers_atlas",
  cost = 6,
  unlocked = false,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = false,
  perishable_compat = false,
  soul_pos = nil,
  pools = {
    Food = true
  },

  paperback_credit = {
    coder = { 'vitellary' }
  },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.a_xmult,
        card.ability.extra.x_mult,
      }
    }
  end,

  
  check_for_unlock = function(self, args)
    if args.type == 'win_no_hand' then
      if not (G.GAME.paperback.destroyed_cards["cards"] >= 1) then
        return true
      end
    end
  end,

  calculate = function(self, card, context)
    if not context.blueprint and context.setting_ability and context.other_card.ability.set == 'Enhanced' and not context.unchanged then
      SMODS.scale_card(card, {
        ref_table = card.ability.extra,
        ref_value = 'x_mult',
        scalar_value = 'a_xmult',
        message_key = 'a_xmult',
        message_colour = G.C.MULT
      })
      return nil, true
    end
    if not context.blueprint and context.remove_playing_cards and #context.removed > 0 then
      if card.ability.extra.x_mult - (card.ability.extra.a_xmult * #context.removed) < 1 then
        PB_UTIL.destroy_joker(card)
        return {
          message = localize('k_eaten_ex'),
          colour = G.C.FILTER
        }
      else
        SMODS.scale_card(card, {
          ref_table = card.ability.extra,
          ref_value = 'x_mult',
          scalar_value = 'a_xmult',
          scalar_factor = #context.removed,
          scaling_message = {
            message = localize {
              type = 'variable',
              key = 'a_xmult_minus',
              vars = { card.ability.extra.a_xmult * #context.removed }
            },
            colour = G.C.MULT
          }
        })
        return nil, true
      end
    end
    if context.cardarea == G.jokers and context.joker_main then
      return { xmult = card.ability.extra.x_mult }
    end
  end
}
