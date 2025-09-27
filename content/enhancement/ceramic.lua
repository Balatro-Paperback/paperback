SMODS.Enhancement {
  key = "ceramic",
  atlas = 'enhancements_atlas',
  pos = { x = 1, y = 0 },
  shatters = true,
  config = {
    extra = {
      a_money_low = 1,
      a_money_high = 5,
      mult_gt_chip = false
    }
  },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.a_money_low  + G.GAME.paperback.ceramic_inc,
        card.ability.extra.a_money_high + G.GAME.paperback.ceramic_inc,
      }
    }
  end,

  calculate = function(self, card, context)
    if context.cardarea == G.play and context.main_scoring then
      local dollars = pseudorandom("Ceramic Money Amount",
        card.ability.extra.a_money_low + G.GAME.paperback.ceramic_inc,
        card.ability.extra.a_money_high + G.GAME.paperback.ceramic_inc)

      return {
        dollars = dollars
      }
    end

    if context.final_scoring_step then
      card.ability.extra.mult_gt_chip = mult > hand_chips
    end

    if context.destroy_card and context.destroy_card == card then
      return {
        remove = card.ability.extra.mult_gt_chip
      }
    end
  end
}
