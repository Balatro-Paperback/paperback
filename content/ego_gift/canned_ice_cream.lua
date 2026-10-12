PB_UTIL.EGO_Gift {
  key = "canned_ice_cream",
  config = {
    sin = 'sloth',
    chips = 0,
    chips_mod = nil
  },
  pos = { x = 2, y = 3 },
  soul_pos = { x = 2, y = 7 },
  atlas = "ego_gift_atlas",
  paperback_credit = {
    coder = { 'thermo' },
    artist = { 'papermoonqueen', 'ari' }
  },

  ego_loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.chips
      }
    }
  end,

  ego_gift_calc = function(self, card, context)
    if context.joker_main and card.ability.chips > 0 then
      return {
        chips = card.ability.chips
      }
    end
    if context.remove_playing_cards then
      card.ability.chips_mod = 0
      for _, c in ipairs(context.removed) do
        card.ability.chips_mod = card.ability.chips_mod + math.ceil((c:get_chip_bonus() * 0.5))
      end
      SMODS.scale_card(card, {
        ref_table = card.ability,
        ref_value = 'chips',
        scalar_value = 'chips_mod',
        message_key = 'a_chips'
      })
      card.ability.chips_mod = nil
      return nil, true
    end
  end
}
