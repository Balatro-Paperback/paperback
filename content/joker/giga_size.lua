SMODS.Joker {
  key = 'giga_size',
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

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.xmult + card.ability.extra.xmult_mod,
        card.ability.extra.xmult_mod
      }
    }
  end,

  locked_loc_vars = function(self, info_queue, card)
    return { vars = { 50 } }
  end,

  check_for_unlock = function(self, args)
    if args.type == 'hand_contents' then
      for j = 1, #args.cards do
        if args.cards[j]:get_chip_bonus() >= 50 then
          return true
        end
      end
    end
    return false
  end,

  calculate = function(self, card, context)
    if not context.blueprint and context.before then
      card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmult_mod
    end

    if context.joker_main then
      return {
        xmult = card.ability.extra.xmult,
      }
    end

    if not context.blueprint and context.end_of_round and context.cardarea == G.jokers then
      card.ability.extra.xmult = 1
      return {
        message = localize('k_reset')
      }
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
