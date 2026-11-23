SMODS.Blind {
  key = "zealot",
  boss = { min = 1 },
  attributes = { "suit", "stars" },
  boss_colour = HEX("ca6ed2"),
  atlas = "wingding_blinds_atlas",
  pos = { y = 25 },
  debuff = { suit = "paperback_Stars" },

  in_pool = function(self)
    for i, v in ipairs(G.playing_cards or {}) do
      if v:is_suit("paperback_Stars") then
        return true
      end
    end

    return false
  end
}
