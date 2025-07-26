SMODS.Sticker {
  key = 'energized',
  atlas = 'stickers_atlas',
  pos = { x = 0, y = 0 },
  badge_colour = G.C.PAPERBACK_ENERGIZED,
  should_apply = false,
  discovered = true,
  rate = 0,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        localize {
          type = 'name_text',
          set = 'Joker',
          key = 'j_paperback_basic_energy'
        }
      }
    }
  end,

  draw = function(self, card)
    -- Don't draw the shine over the sticker
    G.shared_stickers[self.key].role.draw_major = card
    G.shared_stickers[self.key]:draw_shader('dissolve', nil, nil, nil, card.children.center)
  end,
}
