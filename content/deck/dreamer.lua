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
          localize { type = 'name_text', set = 'Stake', key = 'stake_gold' },
          colours = { get_stake_col(8) }
        }
      }
    end,
    check_for_unlock = function(self, args)
      return args.type == 'win_stake' and get_deck_win_stake() >= 8
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
