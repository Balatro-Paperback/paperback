SMODS.Joker {
  key = "nazca_lines",
  config = {
    extra = {
      money = 1
    }
  },
  attributes = {
    'economy'
  },
  rarity = 1,
  pos = { x = 9, y = 13 },
  atlas = "jokers_atlas",
  cost = 6,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,
  unlocked = false,
  paperback_credit = {
    coder = { 'thermo' }
  },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.money
      }
    }
  end,

  locked_loc_vars = function(self, info_queue, card)
    return { vars = { localize('Four of a Kind', 'poker_hands') } }
  end,

  check_for_unlock = function(self, args)
    return args.type == 'paperback_4oak_1_suit'
  end,

  check_for_money = function(context, index)
    local card = context.full_hand[index]

    if context.full_hand[index].debuff or not SMODS.in_scoring(card, context.scoring_hand) then
      return 1
    end
    return 0
  end,

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      -- find context.other_card in context.full_hand
      local full_hand_index, cards = 1, 0
      for i, c in ipairs(context.full_hand) do
        if c == context.other_card then
          full_hand_index = i; break
        end
      end
      -- see if the other two cards around it 1. exist and 2. are debuffed or not scoring
      if full_hand_index > 1 then
        cards = cards + self.check_for_money(context, full_hand_index - 1)
      end

      if full_hand_index < #context.full_hand then
        cards = cards + self.check_for_money(context, full_hand_index + 1)
      end

      -- award money
      if cards > 0 then
        return {
          dollars = cards * card.ability.extra.money
        }
      end
    end
  end
}
