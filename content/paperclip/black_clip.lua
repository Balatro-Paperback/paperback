PB_UTIL.Paperclip {
  key = 'black_clip',
  atlas = 'paperclips_atlas',
  pos = { x = 1, y = 0 },
  badge_colour = G.C.PAPERBACK_BLACK,

  calculate = function(self, card, context)
    if context.repetition and context.cardarea == G.play and not context.platinum_trigger then
      local reps = 0

      for _, v in ipairs(G.hand.cards) do
        if not v.debuff and PB_UTIL.has_paperclip(v) then
          reps = reps + 1
          break
        end
      end

      return {
        repetitions = reps
      }
    end
  end
}
