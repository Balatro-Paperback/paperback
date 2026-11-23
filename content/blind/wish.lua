SMODS.Blind {
  key = "wish",
  boss = { min = 3 },
  attributes = { "hand_type" },
  boss_colour = HEX("a38cb7"),
  atlas = "wingding_blinds_atlas",
  pos = { y = 22 },

  loc_vars = function(self)
    return { vars = { localize(G.GAME.current_round.most_played_poker_hand, "poker_hands") } }
  end,
  collection_loc_vars = function(self)
    return { vars = { localize("ph_most_played") } }
  end,

  calculate = function(self, blind, context)
    if blind.disabled then return end

    if context.debuff_hand and not next(context.poker_hands[G.GAME.current_round.most_played_poker_hand]) then
      return { debuff = true }
    end
  end
}
