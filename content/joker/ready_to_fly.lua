local ignored_contexts = {
  mod_probability = true,
  fix_probability = true,
  check_enhancement = true,
  check_eternal = true,
  modify_scoring_hand = true,
  debuff_hand = true,
  evaluate_poker_hand = true,
  destroy_card = true
}

SMODS.Joker {
  key = 'ready_to_fly',
  rarity = 3,
  pos = { x = 16, y = 0 },
  atlas = 'jokers_atlas',
  cost = 6,
  config = {
    extra = {
      xchips = 1,
      scaling = 0.02
    }
  },
  pools = {
    Music = true
  },
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = false,
  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.xchips,
        card.ability.extra.scaling
      }
    }
  end,

  calculate = function(self, card, context)
    if context.post_trigger and not context.blueprint then
      -- Avoid triggering on the certain contexts, only if there is no message returned
      for k, _ in pairs(ignored_contexts) do
        if context.other_context[k] then
          local has_message

          for _, v in pairs(context.other_ret) do
            if v.message then
              has_message = true
              break
            end
          end

          if not has_message then
            return
          end
        end
      end

      local left_joker = nil
      local right_joker = nil

      for i = 1, #G.jokers.cards do
        if G.jokers.cards[i] == card then
          if i > 1 then
            left_joker = G.jokers.cards[i - 1]
          else
            left_joker = nil
          end
          if i <= #G.jokers.cards then
            right_joker = G.jokers.cards[i + 1]
          else
            right_joker = nil
          end
        end
      end

      if (left_joker and context.other_card == left_joker) or (right_joker and context.other_card == right_joker) then
        card.ability.extra.xchips = card.ability.extra.xchips + card.ability.extra.scaling
        return {
          message = localize('k_upgrade_ex'),
          message_card = card
        }
      end
    end

    if context.joker_main then
      return {
        xchips = card.ability.extra.xchips
      }
    end
  end,

  joker_display_def = function(JokerDisplay)
    return {
      text = {
        {
          border_nodes = {
            { text = 'X' },
            { ref_table = 'card.ability.extra', ref_value = 'xchips' }
          },
          border_colour = G.C.CHIPS
        }
      },
    }
  end
}
