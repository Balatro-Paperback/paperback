PB_UTIL.Paperclip {
  key = 'black_clip',
  attributes = {
    'retrigger'
  },
  atlas = 'paperclips_atlas',
  pos = { x = 1, y = 0 },
  badge_colour = G.C.PAPERBACK_BLACK,

  calculate = function(self, card, context)
    if context.repetition and context.cardarea == G.play and not context.platinum_trigger then
      if PB_UTIL.count_paperclips { area = G.hand } > 0 then
        return {
          repetitions = 1
        }
      end
    end
  end
}
