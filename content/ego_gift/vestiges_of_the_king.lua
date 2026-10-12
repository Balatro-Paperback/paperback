PB_UTIL.EGO_Gift {
  key = "vestiges_of_the_king",
  config = {
    sin = 'pride',

  },
  pos = { x = 5, y = 3 },
  soul_pos = { x = 5, y = 7 },
  atlas = "ego_gift_atlas",
  paperback_credit = {
    coder = { 'thermo' },
    artist = { 'papermoonqueen', 'ari' }
  },

  ego_loc_vars = function(self, info_queue, card)
    return {
      vars = {

      }
    }
  end,

  ego_gift_calc = function(self, card, context)
    if context.discard and #context.full_hand == 1 then
      local enhancement = "m_paperback_" .. pseudorandom_element(PB_UTIL.ENABLED_ENHANCEMENTS, "vestiges_of_the_king")
      context.other_card:set_ability(enhancement, nil, true)
      return {
        message = localize('paperback_enhanced_ex'),
        message_card = context.other_card
      }
    end
  end
}
