PB_UTIL.EGO_Gift {
  key = 'tomorrow_fortune',
  config = {
    sin = 'pride',
    bonus = 1,
  },
  atlas = 'ego_gift_atlas',
  pos = { x = 5, y = 1 },
  soul_pos = { x = 5, y = 4 },

  ego_loc_vars = function(self, info_queue, card)
    return { vars = {
      card.ability.bonus
    } }
  end,

  ego_add = function(self, card, from_debuff)
    G.GAME.modifiers.booster_size_mod = (G.GAME.modifiers.booster_size_mod or 0) + card.ability.bonus
  end,

  ego_remove = function(self, card, from_debuff)
    G.GAME.modifiers.booster_size_mod = (G.GAME.modifiers.booster_size_mod or 0) - card.ability.bonus
  end
}
