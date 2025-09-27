PB_UTIL.EGO_Gift {
  key = 'rusty_coin',
  config = {
    sin = 'sloth',
  },
  atlas = 'ego_gift_atlas',
  pos = { x = 2, y = 1 },
  soul_pos = { x = 2, y = 4 },

  ego_loc_vars = function(self, info_queue, card)
    return {
    }
  end,

  ego_gift_calc = function(self, card, context)
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
