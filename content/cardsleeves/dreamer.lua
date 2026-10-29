if PB_UTIL.config.spectrals_enabled and PB_UTIL.config.ranks_enabled then
  PB_UTIL.Sleeve {
    key = 'dreamer',
    deck_buff = 'b_paperback_dreamer',
    atlas = 'card_sleeves_atlas',
    pos = { x = 3, y = 0 },
    config = {
      consumables = {
        'c_paperback_apostle_of_wands'
      }
    },
    unlocked = false,
    unlock_condition = { deck = "b_paperback_dreamer", stake = "stake_orange" },

    loc_vars = function(self)
      return {
        key = self:loc_key(),
        vars = self:is_buffed() and {
          localize('paperback_Apostle', 'ranks')
        } or {
          localize { type = 'name_text', key = 'c_paperback_apostle_of_wands', set = 'Spectral' },
          self.config.joker_slot
        }
      }
    end,

    apply = function(self, sleeve)
      if self:is_buffed() then
        G.GAME.starting_params.paperback_spawn_apostles = true
        G.GAME.round_resets.blind_states.Small = "Select"
        G.GAME.round_resets.blind_states.Big = "Upcoming"
        G.GAME.blind_on_deck = "Small"

        G.GAME.round_resets.ante = 2
        G.GAME.round_resets.blind_ante = 2
      else
        -- Apply config
        CardSleeves.Sleeve.apply(self, sleeve)
        -- Call apply function from dreamer deck
        SMODS.Back.obj_table[self.deck_buff].apply(self)
      end
    end
  }
end
