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
    return { vars = {
      card.ability.chip_mod,
      card.ability.chips
    } }
  end,

  ego_gift_calc = function(self, card, context)
    if context.final_scoring_step and hand_chips then
      if not (SMODS.calculate_round_score() + G.GAME.chips > G.GAME.blind.chips) then
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
    if context.joker_main then
      return {
        chips = card.ability.chips
      }
    end
  end
}
