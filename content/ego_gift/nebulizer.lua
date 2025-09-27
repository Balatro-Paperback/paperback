PB_UTIL.EGO_Gift {
  key = 'nebulizer',
  config = {
    sin = 'pride',
    xmult = 2,
    extra = {
      odds = 5
    }
  },
  atlas = 'ego_gift_atlas',
  pos = { x = 5, y = 0 },
  soul_pos = { x = 5, y = 3 },

  ego_loc_vars = function(self, info_queue, card)
    local n, d = PB_UTIL.chance_vars(card, nil)
    return {
      n, d, card.ability.xmult
    }
  end,

  ego_gift_calc = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      if PB_UTIL.chance(card, 'nebulizer_xmult') then
        return {
          xmult = card.ability.xmult
        }
      end
    end
  end,
}
