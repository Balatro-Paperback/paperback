PB_UTIL.Paperclip {
  key = 'yellow_clip',
  atlas = 'paperclips_atlas',
  pos = { x = 0, y = 1 },
  badge_colour = G.C.YELLOW,
  badge_text_colour = G.C.PAPERBACK_BLACK,
  config = {
    dollar_odds = 3,
    dollars = 3,
    mult_odds = 5,
    mult = 15,
    xmult_odds = 5,
    xmult = 1.5
  },

  loc_vars = function(self, info_queue, card)
    local clip = card.ability[self.key]

    local n1, d1 = PB_UTIL.chance_vars(card, self.key, nil, clip.mult_odds)
    local n2, d2 = PB_UTIL.chance_vars(card, self.key, nil, clip.xmult_odds)
    local n3, d3 = PB_UTIL.chance_vars(card, self.key, nil, clip.dollar_odds)

    return {
      vars = {
        n1, d1,
        clip.mult,
        n2, d2,
        clip.xmult,
        n3, d3,
        clip.dollars,
      }
    }
  end,

  calculate = function(self, card, context)
    if context.main_scoring and context.cardarea == G.play then
      if PB_UTIL.count_paperclips { area = G.hand, exclude_highlighted = true } > 0 then
        local ret = {}
        local clip = card.ability[self.key]
        if PB_UTIL.chance(card, 'yellow_clip_money', nil, clip.dollar_odds) then
          ret.dollars = clip.dollars
        end
        if PB_UTIL.chance(card, 'yellow_clip_mult', nil, clip.mult_odds) then
          ret.mult = clip.mult
        end
        if PB_UTIL.chance(card, 'yellow_clip_xmult', nil, clip.xmult_odds) then
          ret.xmult = clip.xmult
        end
        return ret
      end
    end
  end
}
