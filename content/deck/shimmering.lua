if PB_UTIL.config.ego_gifts_enabled then
  SMODS.Back {
    key = 'shimmering',
    atlas = 'decks_atlas',
    config = {
      joker_slot = -2,
      extra = {
        a_slot = 1,
      }
    },
    pos = { x = 6, y = 0 },
    unlocked = false,

    locked_loc_vars = function(self, info_queue)
      return { vars = { 10 } }
    end,

    loc_vars = function(self)
      return {
        vars = {
          self.config.extra.a_slot,
          self.config.joker_slot,
        }
      }
    end,
    check_for_unlock = function(self, args)
      if args.type == 'paperback_sold_ego_gifts' then
        return #G.GAME.paperback.sold_ego_gifts >= 10
      end
    end,
    -- Utility function to recalculate consumable slot bonus
    paperback_shimmering_update = function(self)
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
  }

  local add_to_deck_ref = Card.add_to_deck
  function Card.add_to_deck(...)
    add_to_deck_ref(...)
    if G.GAME.selected_back_key and G.GAME.selected_back_key.key == 'b_paperback_shimmering' then
      G.GAME.selected_back_key:paperback_shimmering_update()
    end
  end

  local remove_from_deck_ref = Card.remove_from_deck
  function Card.remove_from_deck(...)
    remove_from_deck_ref(...)
    if G.GAME.selected_back_key and G.GAME.selected_back_key.key == 'b_paperback_shimmering' then
      G.GAME.selected_back_key:paperback_shimmering_update()
    end
  end
end
