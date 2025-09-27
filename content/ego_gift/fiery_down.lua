PB_UTIL.EGO_Gift {
  key = 'fiery_down',
  config = {
    sin = 'lust',
    threshold = 10,
    discarded = 0
  },
  atlas = 'ego_gift_atlas',
  pos = { x = 1, y = 1 },
  soul_pos = { x = 1, y = 4 },



  ego_loc_vars = function(self, info_queue, card)
    return {
      card.ability.threshold,
      card.ability.discarded,
    }
  end,
  ego_gift_calc = function(self, card, context)
    if context.pre_discard and not context.blueprint then
      card.ability.discarded = math.min(card.ability.threshold, card.ability.discarded + #context.full_hand)
      if card.ability.discarded >= card.ability.threshold then
        return {
          message = localize('k_active_ex')
        }
      end
    end

    if context.before then
      if card.ability.discarded >= card.ability.threshold then
        card.ability.discarded = 0
        return {
          level_up = true,
          message = localize('k_level_up_ex'),
        }
      end
    end
  end,
}
