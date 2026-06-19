PB_UTIL.EGO_Gift {
  key = 'decamillennial_stewpot',
  config = {
    sin = 'lust',
  },
  attributes = {
    'hands',
    'destroy_card',
  },
  atlas = 'ego_gift_atlas',
  pos = { x = 1, y = 2 },
  soul_pos = { x = 1, y = 6 },

  ego_gift_calc = function(self, card, context)
    
    if context.first_hand_drawn and not context.blueprint then
      local eval = function() return G.GAME.current_round.hands_played <= 0 and not G.RESET_JIGGLES end
      juice_card_until(card, eval, true)
    end
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
