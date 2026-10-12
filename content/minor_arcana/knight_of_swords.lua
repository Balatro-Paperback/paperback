PB_UTIL.MinorArcana {
  key = 'knight_of_swords',
  attributes = {
    'generation',
    'tarot',
    'minor_arcana',
    'consumable'
  },
  atlas = 'minor_arcana_atlas',
  pos = { x = 4, y = 5 },
  paperback_credit = {
    coder = { 'dowfrin' }
  },

  can_use = function(self, card)
    return true
  end,

  use = function(self, card, area)
    PB_UTIL.use_consumable_animation(card, nil, function()
      PB_UTIL.try_spawn_card { set = 'paperback_minor_arcana', instant = true }
      PB_UTIL.try_spawn_card { set = 'Tarot', instant = true }
    end, 'timpani')
  end
}
