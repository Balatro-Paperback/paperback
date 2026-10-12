PB_UTIL.EGO_Gift {
  key = "tango_marinade",
  config = {
    sin = 'lust',
    poker_hand = 'Three of a Kind',
    repetitions = 3
  },
  pos = { x = 1, y = 3 },
  soul_pos = { x = 1, y = 7 },
  atlas = "ego_gift_atlas",
  paperback_credit = {
    coder = { 'thermo' },
    artist = { 'papermoonqueen', 'ari' }
  },

  ego_loc_vars = function(self, info_queue, card)
    return {
      vars = {
        localize(card.ability.poker_hand, 'poker_hands'),
        card.ability.repetitions
      }
    }
  end,

  ego_gift_calc = function(self, card, context)
    if context.repetition and context.cardarea == G.play and next(context.poker_hands[card.ability.poker_hand]) then
      for i, c in ipairs(context.scoring_hand) do
        if i > card.ability.repetitions then
          break
        end
        if c == context.other_card then
          return {
            repetitions = 1
          }
        end
      end
    end
  end
}
