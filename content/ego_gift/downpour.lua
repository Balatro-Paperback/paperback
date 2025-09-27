PB_UTIL.EGO_Gift {
  key = 'downpour',
  config = {
    sin = 'sloth',
    blind_mod = 0.05
  },
  atlas = 'ego_gift_atlas',
  pos = { x = 2, y = 0 },
  soul_pos = { x = 2, y = 3 },


  ego_loc_vars = function(self, info_queue, card)
    return {
      card.ability.blind_mod * 100,
    }
  end,

  ego_gift_calc = function(self, card, context)
    if context.before then
      G.GAME.blind.chips = G.GAME.blind.chips * (1 - card.ability.blind_mod)
      G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
      G.GAME.blind:wiggle()
      card:juice_up()
    end
  end
}
