PB_UTIL.EGO_Gift {
  key = "snuffed_candlestick",
  config = {
    sin = 'gloom',
    dollars = 2,
    hands_played = 0
  },
  pos = { x = 4, y = 3 },
  soul_pos = { x = 4, y = 7 },
  atlas = "ego_gift_atlas",
  paperback_credit = {
    coder = { 'thermo' },
    artist = { 'papermoonqueen', 'ari' }
  },

  ego_loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.dollars
      }
    }
  end,

  ego_gift_calc = function(self, card, context)
    if context.joker_main then
      card.ability.hands_played = card.ability.hands_played + 1
    end
  end,

  calc_dollar_bonus = function(self, card)
    local mult = card.ability.hands_played - 1
    card.ability.hands_played = 0
    if mult > 0 then return (card.ability.dollars * mult) end
  end
}
