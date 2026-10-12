SMODS.Joker {
  key = "greeting_card",
  config = {
    extra = {
      enhancement = "m_paperback_wrapped",
      a_value = 2,
    }
  },
  attributes = {
    'sell_value',
    'enhancements'
  },
  rarity = 1,
  pos = { x = 21, y = 6 },
  atlas = "jokers_atlas",
  cost = 4,
  unlocked = false,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = false,
  soul_pos = nil,
  paperback = {
    requires_enhancements = true
  },
  enhancement_gate = 'm_paperback_wrapped',

  paperback_credit = {
    coder = { 'dowfrin' },
  },

  check_for_unlock = function(self, args)
    if args.type == 'hand_contents' then
      local wrapped = false
      local lucky = false
      for i = 1, #args.cards do
        if SMODS.has_enhancement(args.cards[i], "m_paperback_wrapped") then
          wrapped = true
        elseif SMODS.has_enhancement(args.cards[i], "m_lucky") then
          lucky = true
        end
      end
      return wrapped and lucky
    end
  end,

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.extra.enhancement]

    return {
      vars = {
        card.ability.extra.a_value,
        localize {
          type = 'name_text',
          set = 'Enhanced',
          key = card.ability.extra.enhancement
        },
      }
    }
  end,

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play and not context.blueprint then
      if SMODS.has_enhancement(context.other_card, card.ability.extra.enhancement) then
        SMODS.scale_card(card, {
          ref_table = card.ability,
          ref_value = 'extra_value',
          scalar_table = card.ability.extra,
          scalar_value = 'a_value',
          scaling_message = {
            message = localize('k_val_up'),
            colour = G.C.MONEY
          }
        })
        card:set_cost()
        return nil, true
      end
    end
  end
}
