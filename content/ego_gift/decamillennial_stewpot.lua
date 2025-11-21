PB_UTIL.EGO_Gift {
  key = 'decamillennial_stewpot',
  config = {
    sin = 'lust',
  },
  atlas = 'ego_gift_atlas',
  pos = { x = 1, y = 2 },
  soul_pos = { x = 1, y = 5 },

  ego_gift_calc = function(self, card, context)
    if context.destroying_card and #context.full_hand == 1 and G.GAME.current_round.hands_played <= 0 and not context.blueprint then
      return {
        remove = true,
        focus = card,
        message = localize('paperback_destroyed_ex'),
        colour = G.C.MULT
      }
    end
  end,
}
