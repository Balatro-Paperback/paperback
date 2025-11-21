SMODS.Joker {
  key = "teapot",
  config = {
    extra = {
      enhancement = "m_paperback_ceramic",
      a_chips = 5,
      chips = 0,
    }
  },
  rarity = 1,
  pos = { x = 21, y = 7 },
  atlas = "jokers_atlas",
  cost = 5,
  unlocked = true,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = false,
  soul_pos = nil,
  paperback = {
    requires_enhancements = true
  },
  enhancement_gate = 'm_paperback_ceramic',

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.extra.enhancement]

    return {
      vars = {
        card.ability.extra.a_chips,
        localize {
          type = 'name_text',
          set = 'Enhanced',
          key = card.ability.extra.enhancement
        },
        card.ability.extra.chips,
      }
    }
  end,

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play and not context.blueprint then
      if SMODS.has_enhancement(context.other_card, card.ability.extra.enhancement) then
        card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.a_chips
        return {
          message = localize {
            type = 'variable',
            key = 'a_chips',
            vars = { card.ability.extra.chips },
            colour = G.C.FILTER,
          },
        }
      end
    end

    if context.joker_main then
      return {
        chips = card.ability.extra.chips
      }
    end
  end,

  joker_display_def = function(JokerDisplay)
    return {
      text = {
        { text = "+" },
        { ref_table = "card.ability.extra", ref_value = "chips", retrigger_type = "mult" }
      },
      text_config = { colour = G.C.CHIPS },
    }
  end,
}
