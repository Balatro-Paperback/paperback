if PB_UTIL.config.spectrals_enabled then
  SMODS.Back {
    key = 'dreamer',
    atlas = 'decks_atlas',
    pos = { x = 3, y = 0 },
    config = {
      consumables = {
        'c_paperback_apostle_of_wands'
      }
    },
    unlocked = false,
    locked_loc_vars = function(self, info_queue, back)
      return {
        vars = {
          localize { type = 'name_text', set = 'Stake', key = 'stake_gold' }, 10,
          colours = { get_stake_col(8) }
        }
      }
    end,
    check_for_unlock = function(self, args)
      if args.type == 'win_stake' then
        local needed_level = G.P_STAKES["stake_gold"].stake_level
        local count = 0
        for _, v in ipairs(G.P_CENTER_POOLS.Joker) do
          local sticker = get_joker_win_sticker(v)
          if sticker then
            local stake = G.P_STAKES["stake_" .. sticker]
            if stake and (stake.stake_level or 0) >= needed_level then
              count = count + 1
            end
          end
        end
        if count >= 10 then return true end
      end
    end,

    loc_vars = function(self)
      return {
        vars = {
          localize { type = 'name_text', key = 'c_paperback_apostle_of_wands', set = 'Spectral' },
        }
      }
    end,

    apply = function(self, back)
      G.GAME.round_resets.blind_states.Small = 'Skipped'
      G.GAME.round_resets.blind_states.Big = 'Select'
      G.GAME.blind_on_deck = 'Big'
      -- Apply the temporary sticker to the first Apostle of Wands found
      G.E_MANAGER:add_event(Event {
        blocking = false,
        func = function()
          for _, v in ipairs(G.consumeables.cards) do
            if v.config.center_key == 'c_paperback_apostle_of_wands' then
              SMODS.Stickers.paperback_temporary:apply(v, true)
              return true
            end
          end
        end
      })
    end
  }
end
