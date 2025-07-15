SMODS.Enhancement {
  key = "bandaged",
  atlas = 'enhancements_atlas',
  pos = { x = 3, y = 0 },
  config = {
    extra = {
      odds = 5
    }
  },

  loc_vars = function(self, info_queue, card)
    local numerator, denominator = PB_UTIL.chance_vars(card, self.key)

    return {
      vars = {
        numerator,
        denominator
      }
    }
  end,

  calculate = function(self, card, context)
    local ctx = context.paperback or {}

    if ctx.repetition_from_playing_card and ctx.cardarea == card.area then
      local scoring = true
      local index

      for k, v in ipairs(ctx.cardarea.cards) do
        if v == card then
          index = k
          break
        end
      end

      if ctx.cardarea == G.play then
        scoring = false

        for k, v in ipairs(ctx.scoring_hand or {}) do
          if v == card then
            scoring = true
            break
          end
        end
      end

      if index and scoring then
        local left = ctx.cardarea.cards[index - 1]
        local right = ctx.cardarea.cards[index + 1]

        if (left == ctx.other_card or right == ctx.other_card) then
          return {
            repetitions = math.max(1, 1 + G.GAME.paperback.bandaged_inc),
            message_card = ctx.other_card,
            juice_card = card,
          }
        end
      end
    end

    if context.destroy_card and context.cardarea == G.play and context.destroy_card == card then
      if PB_UTIL.chance(card, 'bandaged_break') then
        return {
          remove = true
        }
      end
    end
  end
}
