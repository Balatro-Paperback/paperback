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
  unlocked = true,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,
  soul_pos = nil,
  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.xchips,
        card.ability.extra.scaling
      }
    }
  end,

  calculate = function(self, card, context)
    if context.post_trigger then
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
        if not context.blueprint then
          card.ability.extra.xchips = card.ability.extra.xchips + card.ability.extra.scaling
          return {
            message = localize('k_upgrade_ex'),
            message_card = card
          }
        end
      end
    end

    if context.joker_main then
      return {
        xchips = card.ability.extra.xchips
      }
    end
  end
}
