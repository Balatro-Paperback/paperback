if PB_UTIL.config.spectrals_enabled then
  SMODS.Back {
    key = 'dreamer',
    atlas = 'decks_atlas',
    pos = { x = 3, y = 0 },
    config = {
      joker_slot = -1,
      consumables = {
        'c_paperback_apostle_of_wands'
      }
    },

    loc_vars = function(self)
      return {
        vars = {
          localize { type = 'name_text', key = 'c_paperback_apostle_of_wands', set = 'Spectral' },
          self.config.joker_slot
        }
      }
    end,

    apply = function(self, back)
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
