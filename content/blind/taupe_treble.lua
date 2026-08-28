SMODS.Blind {
  key = 'taupe_treble',
  boss = {
    showdown = true, min = 1
  },
  dollars = 8,
  mult = 2,
  boss_colour = HEX("AB9C84"),
  atlas = 'music_blinds_atlas',
  pos = { y = 13 },


  in_pool = function(self)
    local count = 0

    for _, v in ipairs(G.playing_cards or {}) do
      if next(SMODS.get_enhancements(v)) then
        count = count + 1
      end
    end

    return count >= 10
  end,

  recalc_debuff = function(self, card, from_blind)
    return not next(SMODS.get_enhancements(card))
  end
}
