PB_UTIL.MinorArcana {
  key = 'king_of_pentacles',
  config = {
    extra = {
      money = 1,
    }
  },
  atlas = 'minor_arcana_atlas',
  pos = { x = 6, y = 7 },

  loc_vars = function(self, info_queue, card)
    local faces = 0
    if G.playing_cards then
      for k, v in ipairs(G.playing_cards) do
        if v:is_face(true) then faces = faces + 1 end
      end
    elseif G.STATE == G.STATES.MENU then
      faces = 12
    end
    return {
      vars = {
        card.ability.extra.money,
        faces * card.ability.extra.money
      }
    }
  end,

  can_use = function(self, card)
    return true
  end,

  use = function(self, card, area)
    local faces = 0
    if G.playing_cards then
      for k, v in ipairs(G.playing_cards) do
        if v:is_face(true) then faces = faces + 1 end
      end
    end

    G.E_MANAGER:add_event(Event {
      trigger = 'after',
      delay = 0.4,
      func = function()
        if faces > 0 then
          ease_dollars(faces * card.ability.extra.money)
        end
        return true
      end
    })
  end
}
