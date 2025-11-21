PB_UTIL.EGO_Gift {
  key = 'coffee_and_cranes',
  config = {
    sin = 'lust',
    dollars = 3,
  },

  atlas = 'ego_gift_atlas',
  pos = { x = 1, y = 0 },
  soul_pos = { x = 1, y = 3 },
  ego_loc_vars = function(self, info_queue, card)
    return { vars = {
      card.ability.dollars
    } }
  end,

  calc_dollar_bonus = function(self, card)
    return card.ability.dollars
  end
}
