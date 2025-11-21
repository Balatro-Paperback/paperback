SMODS.Joker {
  key = "greeting_card",
  config = {
    extra = {
      enhancement = "m_paperback_wrapped",
      a_value = 2,
    }
  },
  rarity = 1,
  pos = { x = 21, y = 6 },
  atlas = "jokers_atlas",
  cost = 4,
  unlocked = true,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = false,
  soul_pos = nil,
  paperback = {
    requires_enhancements = true
  },
  enhancement_gate = 'm_paperback_wrapped',

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
        PB_UTIL.modify_sell_value(card, card.ability.extra.a_value)

        return {
          focus = card,
          message = localize('k_val_up'),
          colour = G.C.MONEY
        }
      end
    end
  end
}
