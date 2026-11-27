PB_UTIL.Sleeve {
  key = 'paper',
  deck_buff = 'b_paperback_paper',
  atlas = 'card_sleeves_atlas',
  pos = { x = 0, y = 0 },

  loc_vars = function(self)
    return {
      key = self:loc_key(),
      vars = {
        localize {
          type = 'name_text',
          set = 'Joker',
          key = 'j_paperback_shopping_center'
        }
      }
    }
  end,
  unlocked = false,
  unlock_condition = { deck = "b_paperback_paper", stake = "stake_red" },

  apply = function(self, sleeve)
    if self:is_buffed() then
      -- Apply negative to the created Shopping Center
      G.E_MANAGER:add_event(Event {
        blocking = false,
        func = function()
          for _, v in ipairs(G.jokers.cards) do
            if v.config.center_key == 'j_paperback_shopping_center' then
              v:set_edition('e_negative', true, true)
              return true
            end
          end
        end
      })
    else
      -- Spawn a Shopping Center Joker
      delay(0.4)
      G.E_MANAGER:add_event(Event({
        func = function()
          local card = SMODS.add_card { key = 'j_paperback_shopping_center' }
          card:start_materialize()
          return true
        end
      }))
    end
  end,
  calculate = function(self, sleeve, context)
    if context.modify_weights and (G.GAME.selected_back_key or {}).key ~= "b_paperback_paper" then
      for i, item in ipairs(context.pool) do
        local center = G.P_CENTERS[item.key]
        if center and center.set == "Joker" then
          if item.key:find('j_paperback_') or (center.attributes or {}).Paperback then
            item.weight = item.weight * 3
          end
        end
      end
    end
  end
}
