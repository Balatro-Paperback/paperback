SMODS.Blind {
  key = "taboo",
  boss = { min = 2 },
  boss_colour = HEX("8995d6"),
  atlas = "wingding_blinds_atlas",
  pos = { y = 19 },

  in_pool = function(self, args)
    return PB_UTIL.any_hand_played(G.GAME.paperback.secret_hands) and G.GAME.round_resets.ante >= 2
  end,

  calculate = function(self, blind, context)
    if blind.disabled then return end

    if context.debuff_hand then
      for i, v in ipairs(G.GAME.paperback.secret_hands) do
        if context.scoring_name == v then return { debuff = true } end
      end
    end
  end
}
