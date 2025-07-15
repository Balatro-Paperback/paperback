if PB_UTIL.config.suits_enabled then
  PB_UTIL.Sleeve {
    key = 'proud',
    deck_buff = 'b_paperback_proud',
    atlas = 'card_sleeves_atlas',
    pos = { x = 1, y = 0 },
    paperback = {
      create_crowns = true,
      create_stars = true
    },

    apply = function(self, sleeve)
      if self:is_buffed() then
        -- Apply polychrome to all Aces
        G.E_MANAGER:add_event(Event {
          func = function()
            for _, v in ipairs(G.playing_cards or {}) do
              if v:get_id() == 14 then
                v:set_edition('e_polychrome', true, true)
              end
            end
            return true
          end
        })
      end
    end
  }
end
