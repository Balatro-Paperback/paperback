PB_UTIL.EGO_Gift {
  key = 'imposed_weight',
  config = {
    sin = 'wrath',
    a_rep = 1,
  },
  atlas = 'ego_gift_atlas',
  pos = { x = 0, y = 0 },
  soul_pos = { x = 0, y = 3 },

  ego_gift_calc = function(self, card, context)
    if context.repetition and context.scoring_hand then
      if context.other_card == context.scoring_hand[#context.scoring_hand] then
        local empty_slots = G.jokers.config.card_limit - #G.jokers.cards
        return {
          repetitions = card.ability.a_rep * math.max(0, empty_slots)
        }
      end
    end
  end,

  ego_loc_vars = function(self, info_queue, card)
    return {
      card.ability.a_rep
    }
  end,
}
