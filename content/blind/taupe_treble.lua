SMODS.Blind {
  key = 'taupe_treble',
  boss = {
    showdown = true, min = 1
  },
  in_pool = function(self)
    if G.playing_cards then
      local count = 0
      for _, v in ipairs(G.playing_cards) do
        if next(SMODS.get_enhancements(v)) then
          count = count + 1
        end
      end
      return count >= 10
    end
  end,
  mult = 2,
  boss_colour = HEX("AB9C84"),
  atlas = 'music_blinds_atlas',
  pos = { y = 13 },

  recalc_debuff = function(self, card, from_blind)
    if next(SMODS.get_enhancements(card)) then
      return false
    end
    return true
  end
}
