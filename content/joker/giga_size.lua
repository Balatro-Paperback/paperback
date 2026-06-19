SMODS.Joker {
  key = 'giga_size',
  attributes = {
    'xmult',
    'hands',
    'reset'
  },
  rarity = 3,
  pos = { x = 17, y = 7 },
  atlas = 'jokers_atlas',
  cost = 8,
  unlocked = false,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,
  config = { extra = { xmult = 1, xmult_mod = 1 } },
  soul_pos = nil,
  paperback_credit = {
    coder = { 'dowfrin' },
  },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.xmult + card.ability.extra.xmult_mod,
        card.ability.extra.xmult_mod
      }
    }
  end,

  locked_loc_vars = function(self, info_queue, card)
    return { vars = { 10 } }
  end,

  check_for_unlock = function(self, args)
    return G.GAME.current_round.hands_left and G.GAME.current_round.hands_left  >= 10
  end,

  calculate = function(self, card, context)
    if not context.blueprint and context.before then
      SMODS.scale_card(card, {
        ref_table = card.ability.extra,
        ref_value = 'xmult',
        scalar_value = 'xmult_mod',
        no_message = true
      })
    end

    if context.joker_main then
      return {
        xmult = card.ability.extra.xmult,
      }
    end

    if not context.blueprint and context.end_of_round and context.cardarea == G.jokers then
      SMODS.reset_card(card, {
        ref_table = card.ability.extra,
        ref_value = 'xmult',
        reset_value = 1
      })
      return nil, true
    end
  end,

  joker_display_def = function(JokerDisplay)
    return {
      text = {
        {
          border_nodes = {
            { text = "X" },
            { ref_table = "card.joker_display_values", ref_value = "xmult", retrigger_type = "exp" }
          }
        }
      },
      calc_function = function(card)
        card.joker_display_values.xmult = card.ability.extra.xmult + card.ability.extra.xmult_mod
      end
    }
  end,
}
