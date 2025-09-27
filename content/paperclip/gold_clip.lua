PB_UTIL.Paperclip {
  key = 'gold_clip',
  atlas = 'paperclips_atlas',
  pos = { x = 2, y = 0 },
  badge_colour = G.C.GOLD,
  badge_text_colour = G.C.WHITE,
  shiny = true,
  config = {
    money = 1,
    max_money = 10,
  },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability[self.key].money,
        math.min(
          card.ability[self.key].money * (G.GAME.paperback.round.scored_clips or 0),
          card.ability[self.key].max_money),
        card.ability[self.key].max_money
      }
    }
  end,

  calculate = function(self, card, context)
    if context.playing_card_end_of_round then
      if context.cardarea == G.hand and not context.repetition and not context.individual and G.GAME.paperback.round.scored_clips > 0 then
        return {
          dollars = math.min(
            card.ability[self.key].money * (G.GAME.paperback.round.scored_clips or 0),
            card.ability[self.key].max_money)
        }
      end
    end
  end
}
