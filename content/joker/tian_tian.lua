SMODS.Joker {
  key = 'tian_tian',
  config = {
    extra = {
      a_xmult = 0.1,
      x_mult = 1,
    }
  },
  attributes = {
    'xmult',
    'scaling',
    'music'
  },
  rarity = 3,
  pos = { x = 12, y = 9 },
  atlas = 'jokers_atlas',
  pools = {
    Music = true
  },
  cost = 7,
  unlocked = false,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = false,
  soul_pos = nil,

  paperback_credit = {
    coder = { 'thermo' }
  },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.a_xmult,
        card.ability.extra.x_mult,
      }
    }
  end,

  locked_loc_vars = function (self, info_queue, card)
    local other_name = localize('k_unknown')
    if G.P_CENTERS['j_bloodstone'].unlocked then
      other_name = localize { type = 'name_text', set = 'Joker', key = 'j_bloodstone' }
    end
    return {
      vars = {
        other_name, 13
      }
    }
  end,

  check_for_unlock = function (self, args)
    if args.type == 'paperback_bloodstone_triggers' then
      return true
    end
  end,

  calculate = function(self, card, context)
    -- Gains x_mult when playing cards are destroyed. Each card destroyed provides the specified xmult_mod
    if not context.blueprint and context.remove_playing_cards and context.removed and #context.removed > 0 then
      local scale = #context.removed
      SMODS.scale_card(card, {
        ref_table = card.ability.extra,
        ref_value = 'x_mult',
        scalar_value = 'a_xmult',
        scalar_factor = scale,
        message_key = 'a_xmult'
      })
      return nil, true
    end

    -- Gives the x_mult when scoring
    if context.joker_main then
      return {
        x_mult = card.ability.extra.x_mult
      }
    end
  end,

  joker_display_def = function(JokerDisplay)
    return {
      text = {
        {
          border_nodes = {
            { text = "X" },
            { ref_table = "card.ability.extra", ref_value = "x_mult", retrigger_type = "exp" }
          }
        }
      },
    }
  end,
}
