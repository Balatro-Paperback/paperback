SMODS.Blind {
  key = "finger",
  boss = { min = 1 },
  attributes = { "suit", "crowns" },
  boss_colour = HEX("b77454"),
  atlas = "wingding_blinds_atlas",
  pos = { y = 5 },
  debuff = { suit = "paperback_Crowns" },

  in_pool = function(self)
    for i, v in ipairs(G.playing_cards or {}) do
      if v:is_suit("paperback_Crowns") then
        return true
      end
    end

    return false
  end
}
