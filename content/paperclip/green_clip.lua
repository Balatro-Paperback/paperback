PB_UTIL.Paperclip {
  key = 'green_clip',
  atlas = 'paperclips_atlas',
  pos = { x = 1, y = 1 },
  badge_colour = G.C.GREEN,
  config = {
    mult = 0,
    mult_plus = 1,
    mult_minus = 5
  },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability[self.key].mult,
        card.ability[self.key].mult_plus,
        -card.ability[self.key].mult_minus
      }
    }
  end,

  calculate = function(self, card, context)
    if context.main_scoring and context.cardarea == G.play and card.ability[self.key].mult > 0 then
      return {
        mult = card.ability[self.key].mult
      }
    end
  end
}
