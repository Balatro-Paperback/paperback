PB_UTIL.EGO_Gift {
  key = 'lightning_rod',
  config = {
    sin = 'envy',
    odds = 2
  },
  atlas = 'ego_gift_atlas',
  pos = { x = 6, y = 0 },
  soul_pos = { x = 6, y = 3 },

  ego_loc_vars = function(self, info_queue, card)
    local n, d = PB_UTIL.chance_vars(card, nil, 1, card.ability.odds)
    return {
      n, d
    }
  end,

  ego_gift_calc = function(self, card, context)
    if context.repetition and context.cardarea == G.hand and next(context.card_effects[1]) then
      if PB_UTIL.chance(card, pseudoseed('lightning_rod'), nil, card.ability.odds) then
        return {
          message = localize("k_again_ex"),
          repetitions = 1,
        }
      end
    end
  end
}
