PB_UTIL.MinorArcana {
  key = 'ten_of_pentacles',
  atlas = 'minor_arcana_atlas',
  pos = { x = 2, y = 7 },

  config = { extra = {
    min = 5,
    max = 10
  } },

  loc_vars = function(self, info_queue, card)
    return { vars = {
      card.ability.extra.min,
      card.ability.extra.max
    } }
  end,

  can_use = function(self, card)
    return true
  end,

  use = function(self, card)
    ease_dollars(pseudorandom("ten_of_pentacles", card.ability.extra.min, card.ability.extra.max))
  end
}
