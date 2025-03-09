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
    return {
      vars = {
        G.GAME.probabilities.normal,
        card.ability.extra.odds
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
            repetitions = 1 + (G.GAME.round_resets.paperback_bandaged_inc or 0),
            message_card = ctx.other_card,
            juice_card = card,
          }
        end
      end
    end

    if context.destroy_card and context.cardarea == G.play then
      if pseudorandom('bandaged_break') < G.GAME.probabilities.normal / card.ability.extra.odds then
        return {
          remove = true
        }
      end
    end
  end
}
