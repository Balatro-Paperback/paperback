PB_UTIL.EGO_Gift {
  key = 'smokes_and_wires',
  config = {
    sin = 'wrath',
    xmult = 2,
  },
  atlas = 'ego_gift_atlas',
  pos = { x = 0, y = 2 },
  soul_pos = { x = 0, y = 5 },


  ego_gift_calc = function(self, card, context)
    if context.joker_main then
      if G.GAME.current_round.hands_left == 0 then
        return {
          xmult = card.ability.xmult
        }
      end
    end
  end,

  ego_loc_vars = function(self, info_queue, card)
    return {
      card.ability.xmult
    }
  end,
}
