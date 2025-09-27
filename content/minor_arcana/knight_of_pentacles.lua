PB_UTIL.MinorArcana {
  key = 'knight_of_pentacles',
  atlas = 'minor_arcana_atlas',
  pos = { x = 4, y = 7 },

  can_use = function(self, card)
    return true
  end,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        (G.STATE == G.STATES.MENU and 5) or G.GAME.round_resets.reroll_cost
      }
    }
  end,

  use = function(self, card, area)
    G.GAME.current_round.reroll_cost = G.GAME.round_resets.reroll_cost
  end
}
