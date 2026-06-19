PB_UTIL.EGO_Gift {
  key = 'rusty_coin',
  config = {
    sin = 'sloth',
  },
  attributes = {
    'hands',
    'seals'
  },
  atlas = 'ego_gift_atlas',
  pos = { x = 2, y = 1 },
  soul_pos = { x = 2, y = 5 },

  ego_gift_calc = function(self, card, context)
    if context.first_hand_drawn and not context.blueprint then
      local eval = function() return G.GAME.current_round.hands_played <= 0 and not G.RESET_JUGGLES end
      juice_card_until(card, eval, true)
    end
    if context.before and #context.full_hand == 1 and G.GAME.current_round.hands_played <= 0 and not context.blueprint then
      local coin = context.full_hand[1]
      local seal = SMODS.poll_seal {
        key = 'rusty_coin_seal',
        guaranteed = true
      }

      G.E_MANAGER:add_event(Event {
        trigger = 'after',
        delay = 0.5,
        func = function()
          coin:set_seal(seal, nil, true)
          coin:juice_up()
          card:juice_up()
          return true
        end
      })
    end
  end,
}
