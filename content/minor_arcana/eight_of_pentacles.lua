PB_UTIL.MinorArcana {
  key = 'eight_of_pentacles',
  config = {
    extra = {
      money = 1,
    }
  },
  atlas = 'minor_arcana_atlas',
  pos = { x = 0, y = 7 },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.money,
        (G.GAME.paperback.arcana_used and #G.GAME.paperback.arcana_used or 0) * card.ability.extra.money
      }
    }
  end,

  can_use = function(self, card)
    return true
  end,

  use = function(self, card, area)
    local amount = #G.GAME.paperback.arcana_used

    G.E_MANAGER:add_event(Event {
      trigger = 'after',
      delay = 0.4,
      func = function()
        if amount > 0 then
          ease_dollars(amount * card.ability.extra.money)
        end
        return true
      end
    })
  end
}
