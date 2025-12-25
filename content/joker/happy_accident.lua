SMODS.Joker {
  key = "happy_accident",
  rarity = 2,
  config = {
    extra = {
      enhancement = 'm_paperback_antique',
    }
  },
  pos = { x = 21, y = 0 },
  atlas = 'jokers_atlas',
  cost = 7,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = false,
  paperback = {
    requires_enhancements = true
  },

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.extra.enhancement]

    return {
      vars = {
        localize {
          type = 'name_text',
          set = 'Enhanced',
          key = card.ability.extra.enhancement
        },
      }
    }
  end,

  enhancement_gate = 'm_paperback_antique',

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.hand and not context.end_of_round and SMODS.has_enhancement(context.other_card, card.ability.extra.enhancement) then
      if context.other_card.ability.extra.xchips then
        return {
          xchips = ((context.other_card.ability.extra.xchips - 1) / 2) + 1 or 1,
        }
      end
    end
  end,
}
