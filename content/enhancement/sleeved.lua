SMODS.Enhancement {
  key = "sleeved",
  atlas = "enhancements_atlas",
  pos = { x = 7, y = 0 },
  config = { extra = {
    money = 5
  } },

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.money } }
  end,

  calculate = function(self, card, context)
    if context.stay_flipped and context.other_card == card then
      return { prevent_stay_flipped = true }
    end

    if context.remove_playing_cards then
      for _, removed in ipairs(context.removed) do
        if removed == card then return { dollars = card.ability.extra.money } end
      end
    end
  end,

  -- the actual center sprite should just be the base unenhanced card
  set_sprites = function(self, card, front)
    card.children.center:set_sprite_pos({ x = 6, y = 0 })
    card.children.center.paperback_sleeved = true
  end
}

-- drawstep for sleeved graphic to draw over the top of the card front + edition
SMODS.DrawStep {
  key = "sleeved",
  order = 21,
  func = function(self, layer)
    if self.children.center.paperback_sleeved then
      self.children.center:set_sprite_pos({ x = 7, y = 0 })
      self.children.center:draw_shader('dissolve')
      self.children.center:set_sprite_pos({ x = 6, y = 0 })
    end
  end,
  conditions = { vortex = false, facing = 'front' }
}
