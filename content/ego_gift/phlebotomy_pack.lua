PB_UTIL.EGO_Gift {
  key = 'phlebotomy_pack',
  config = {
    sin = 'wrath',
    a_hand = 1,
  },
  atlas = 'ego_gift_atlas',
  pos = { x = 0, y = 1 },


  ego_gift_calc = function(self, card, context)
    if context.setting_blind then
      G.E_MANAGER:add_event(Event({
        func = function()
          ease_hands_played(card.ability.a_hand)
          card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil,
            { message = localize { type = 'variable', key = 'a_hands', vars = { card.ability.a_hand } } })
          return true
        end
      }))
      return nil, true
    end
  end,

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = PB_UTIL.sin_tooltip(card.ability.sin)

    return {
      vars = {
        card.ability.a_hand
      }
    }
  end,
}
