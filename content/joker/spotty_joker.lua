SMODS.Joker {
  key = "spotty_joker",
  config = {
    extra = {
      xmult_mod = 0.1,
      xmult = 1,
    }
  },
  attributes = {
    'xmult',
    'scaling',
    'enhancements'
  },
  rarity = 2,
  pos = { x = 17, y = 9 },
  atlas = "jokers_atlas",
  cost = 3,
  unlocked = false,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = false,
  paperback = {
    requires_enhancements = true
  },
  enhancement_gate = 'm_paperback_domino',

  paperback_credit = {
    coder = { 'dowfrin' }
  },

  check_for_unlock = function(self, args)
    return args.type == 'round_win' and G.GAME.paperback.round.played_only_straights and G.GAME.blind.boss
  end,

  locked_loc_vars = function (self, info_queue, card)
    return { vars = { localize('Straight', 'poker_hands') }}
  end,

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
        card.ability.extra.xmult,
      }
    }
  end,

  calculate = function(self, card, context)
    if context.before and not context.blueprint then
      local upgrade = 0
      for _, v in ipairs(context.scoring_hand) do
        if SMODS.has_enhancement(v, 'm_paperback_domino') then
          upgrade = upgrade + 1
        end
      end
      if upgrade > 0 then
        SMODS.scale_card(card, {
          ref_table = card.ability.extra,
          ref_value = 'xmult',
          scalar_value = 'xmult_mod',
          operation = function(ref_table, ref_value, initial, scaling)
            ref_table[ref_value] = initial + scaling * upgrade
          end
        })
        return nil, true
      end
    end


    if context.joker_main then
      return {
        x_mult = card.ability.extra.xmult,
      }
    end
  end,

  joker_display_def = function(JokerDisplay)
    return {
      text = {
        {
          border_nodes = {
            { text = "X" },
            { ref_table = "card.ability.extra", ref_value = "xmult", retrigger_type = "exp" }
          }
        }
      },
    }
  end,
}
