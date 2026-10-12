SMODS.Challenge {
  key = 'borderline',
  jokers = {
    { id = "j_paperback_let_it_happen", eternal = true, edition = 'negative' },
  },
  rules = {
    custom = {
      { id = "paperback_2x_blind_size" }
    }
  },
  unlocked = function (self)
    return G.P_CENTERS["j_paperback_let_it_happen"].unlocked
  end,

  apply = function(self)
    G.GAME.paperback.blind_multiplier = G.GAME.paperback.blind_multiplier * 2
  end
}
