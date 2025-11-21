PB_UTIL.EGO_Gift {
  key = 'broken_glasses',
  config = {
    sin = 'gloom',
    odds = 4
  },
  atlas = 'ego_gift_atlas',
  pos = { x = 4, y = 2 },
  soul_pos = { x = 4, y = 5 },

  ego_loc_vars = function(self, info_queue, card)
    local n, d = PB_UTIL.chance_vars(card, nil, 1, card.ability.odds)
    return { vars = {
      n, d
    } }
  end,
  ego_gift_calc = function(self, card, context)
    if context.remove_playing_cards and #context.removed > 0 and #context.removed <= 2 then
      G.E_MANAGER:add_event(Event({
        func = function()
          local fx = {}
          local _first_dissolve = nil
          for _, v in ipairs(context.removed) do
            for i = 1, 2, 1 do
              G.playing_card = (G.playing_card or 0) + 1
              local new_card = copy_card(v, nil, nil, G.playing_card)
              new_card:add_to_deck()
              G.deck.config.card_limit = G.deck.config.card_limit + 1
              table.insert(G.playing_cards, new_card)
              G.hand:emplace(new_card)
              new_card:start_materialize(nil, _first_dissolve)
              _first_dissolve = true
              fx[#fx + 1] = new_card
            end
          end
          playing_card_joker_effects(fx)
          return true
        end
      }))

      if PB_UTIL.chance(card, pseudoseed('broken_glasses'), nil, card.ability.odds) then
        SMODS.destroy_cards({ card })
        return {
          message = localize('paperback_broken_ex')
        }
      end
    end
  end
}
