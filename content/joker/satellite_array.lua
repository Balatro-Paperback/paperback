SMODS.Joker {
  key = "satellite_array",
  blueprint_compat = true,
  rarity = 2,
  cost = 7,
  pos = { x = 20, y = 1 },
  atlas = "jokers_atlas",
  perishable_compat = false,
  config = { extra = { chips_mod = 15, chips_rem = 5, chips = 0 } },
  attributes = {
    'chips',
    'scaling',
    'planet'
  },

  paperback_credit = {
    coder = { 'thermo' }
  },
  unlocked = false,

  locked_loc_vars = function(self, info_queue, card)
    local other_name = localize('k_unknown')
    if G.P_CENTERS['v_observatory'].unlocked then
      other_name = localize { type = 'name_text', set = 'Voucher', key = 'v_observatory' }
    end
    return {
      vars = {
        other_name
      }
    }
  end,

  check_for_unlock = function(self, args)
    local count = 0
    if G.vouchers then
      for _, v in ipairs(G.vouchers.cards or {}) do
        if v.config.center.key == 'v_observatory' then
          return true
        end
      end
    end
  end,

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.chips_mod, card.ability.extra.chips_rem, card.ability.extra.chips, localize('k_planet') } }
  end,
  calculate = function(self, card, context)
    if context.joker_main and card.ability.extra.chips > 0 then
      return {
        chips = card.ability.extra.chips
      }
    end
    if context.after and card.ability.extra.chips > 0 and not context.blueprint then
      SMODS.scale_card(card, {
        ref_table = card.ability.extra,
        ref_value = 'chips',
        scalar_value = 'chips_rem',
        operation = '-',
        scaling_message = {
          message = localize('paperback_downgrade_ex'),
          colour = G.C.ORANGE
        }
      })
      return nil, true
    end
    if context.using_consumeable and not context.blueprint and context.consumeable.ability.set == 'Planet' then
      SMODS.scale_card(card, {
        ref_table = card.ability.extra,
        ref_value = 'chips',
        scalar_value = 'chips_mod',
        message_key = 'a_chips'
      })
      return nil, true
    end
  end,

  joker_display_def = function(JokerDisplay)
    return {
      text = {
        { text = "+" },
        { ref_table = "card.ability.extra", ref_value = "chips", retrigger_type = "mult" }
      },
      text_config = { colour = G.C.CHIPS },
    }
  end,
}
