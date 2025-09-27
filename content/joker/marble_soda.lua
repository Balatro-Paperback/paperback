SMODS.Joker {
  key = "marble_soda",
  config = {
    extra = {
      enhancement = 'm_glass',
      xmult = 1.5,
      drank_after = 5
    }
  },
  rarity = 2,
  pos = { x = 18, y = 9 },
  atlas = "jokers_atlas",
  cost = 6,
  unlocked = true,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = false,
  soul_pos = nil,
  enhancement_gate = 'm_glass',
  pools = {
    Food = true
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
        card.ability.extra.xmult,
        card.ability.extra.drank_after,
        card.ability.extra.drank_after == 1 and "" or "s",
        card.ability.extra.drank_after == 1 and "is" or "are",
      }
    }
  end,

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      if SMODS.has_enhancement(context.other_card, card.ability.extra.enhancement) then
        return {
          xmult = card.ability.extra.xmult,
        }
      end
    end

    if not context.blueprint and context.remove_playing_cards and context.removed and #context.removed > 0 then
      card.ability.extra.drank_after = math.max(0, card.ability.extra.drank_after - #context.removed)
      if card.ability.extra.drank_after <= 0 then
        PB_UTIL.destroy_joker(card)
        return {
          message = localize('k_drank_ex'),
          colour = G.C.BLUE
        }
      end
    end
  end
}
