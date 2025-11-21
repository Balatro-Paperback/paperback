PB_UTIL.Paperclip {
  key = 'black_clip',
  atlas = 'paperclips_atlas',
  pos = { x = 1, y = 0 },
  badge_colour = G.C.PAPERBACK_BLACK,

  calculate = function(self, card, context)
    if context.repetition and context.cardarea == G.play and not context.platinum_trigger then
      local clip_held = false

      for _, v in ipairs(G.hand.cards) do
        if not v.debuff and PB_UTIL.has_paperclip(v) then
          clip_held = true
          break
        end
      end

      if clip_held then
        return {
          repetitions = 1
        }
      end
    end
  end
}
