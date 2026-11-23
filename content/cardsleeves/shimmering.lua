if PB_UTIL.config.ego_gifts_enabled then
  PB_UTIL.Sleeve {
    key       = 'shimmering',
    deck_buff = 'b_paperback_shimmering',
    atlas     = 'card_sleeves_atlas',
    pos       = { x = 10, y = 0 },
    config = {
      joker_slot = -2,
      extra = {
        a_slot = 1,
      }
    },
    unlocked = false,
    unlock_condition = { deck = "b_paperback_shimmering", stake = "stake_purple" },

    loc_vars = function(self)
      return {
        key = self:loc_key(),
        vars = {
          self.config.extra.a_slot, 
          self.config.joker_slot
        }
      }
    end,

    apply = function(self, sleeve)
      CardSleeves.Sleeve.apply(self, sleeve)
      G.GAME.paperback.shimmering_ego_deck = true
    end,
    
    calculate = function(self, sleeve, context)
    if self:is_buffed() then
      if context.selling_card and context.card.ability.sin then
        G.jokers.config.card_limit = G.jokers.config.card_limit + self.config.extra.a_slot
      end
    end
  end,

    paperback_shimmering_update = function(self)
      if not self:is_buffed() then
        local sins = {}
        local count = 0
        for _, v in ipairs(G.consumeables.cards) do
          if v.ability.sin and v.ability.sin ~= 'none' then
            if not sins[v.ability.sin] then
              sins[v.ability.sin] = true
              count = count + 1
            end
          end
        end

        local change = count - G.GAME.paperback.shimmering_change
        if change ~= 0 then
          G.consumeables:change_size(change)

          G.GAME.paperback.shimmering_change = count
        end
      end
    end
  }
end
