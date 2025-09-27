PB_UTIL.EGO_Gift {
  key = 'ragged_umbrella',
  config = {
    sin = 'sloth',
    chip_mod = 5,
    chips = 0
  },
  atlas = 'ego_gift_atlas',
  pos = { x = 2, y = 2 },
  soul_pos = { x = 2, y = 5 },


  ego_loc_vars = function(self, info_queue, card)
    return {
      card.ability.chip_mod,
      card.ability.chips
    }
  end,

  ego_gift_calc = function(self, card, context)
    if context.final_scoring_step and hand_chips then
      if not ((hand_chips * mult) + G.GAME.chips > G.GAME.blind.chips) then
        card.ability.chips = card.ability.chips + card.ability.chip_mod
        return {
          message = localize {
            type = 'variable',
            key = 'a_chips',
            vars = { card.ability.chip_mod }
          },
          colour = G.C.CHIPS
        }
      end
    end
    if context.joker_main and context.cardarea == G.consumeables then
      return {
        chips = card.ability.chips
      }
    end
  end
}
