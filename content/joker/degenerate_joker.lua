SMODS.Joker {
  key = 'degenerate_joker',
  config = {
    extra = {
      enhancement = 'm_wild',
    }
  },
  attributes = {
    'position',
    'modify_card',
    'enhancements'
  },
  rarity = 1,
  pos = { x = 25, y = 8 },
  atlas = 'jokers_atlas',
  cost = 4,
  unlocked = false,
  discovered = false,
  blueprint_compat = false,
  eternal_compat = true,
  perishable_compat = true,
  enhancement_gate = 'm_wild',
  paperback_credit = {
    coder = { 'dowfrin' },
  },

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.extra.enhancement]

    return {
      vars = { localize {
        type = 'name_text',
        set = 'Enhanced',
        key = card.ability.extra.enhancement
      } }
    }
  end,

  check_for_unlock = function(self, args)
    if args.type == 'modify_deck' then
      for _, v in pairs(G.playing_cards) do
        if SMODS.has_enhancement(v, 'm_wild') then
          return true
        end
      end
    end
  end,

  calculate = function(self, card, context)
    if context.before then
      PB_UTIL.use_consumable_animation(card, context.full_hand, function()
        for i, v in ipairs(context.full_hand) do
          if context.full_hand[i + 1] and SMODS.has_enhancement(v, card.ability.extra.enhancement) then
            SMODS.copy_card(context.full_hand[i + 1], { new_card = v })
            v:juice_up()
          end
        end
      end)
    end
  end,
}
