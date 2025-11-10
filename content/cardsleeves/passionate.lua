if PB_UTIL.config.tags_enabled then
  PB_UTIL.Sleeve {
    key = 'passionate',
    deck_buff = 'b_paperback_passionate',
    atlas = 'card_sleeves_atlas',
    pos = { x = 5, y = 0 },
    config = {
      no_interest = true
    },
    unlocked = false,
    unlock_condition = { deck = "b_paperback_passionate", stake = "stake_black" },

    loc_vars = function(self)
      return {
        key = self:loc_key(),
        vars = {
          localize {
            type = 'name_text',
            set = 'Tag',
            key = 'tag_paperback_high_risk'
          }
        }
      }
    end,

    apply = function(self, sleeve)
      if self:is_buffed() then
        G.GAME.modifiers.paperback_more_showdowns = true
      else
        CardSleeves.Sleeve.apply(self, sleeve)
      end
    end,

    calculate = function(self, sleeve, context)
      if not self:is_buffed() then
        return SMODS.Back.obj_table[self.deck_buff].calculate(self, sleeve, context)
      end

      -- When buffed, give a Negative tag after defeating a showdown boss
      if context.end_of_round and context.beat_boss and G.GAME.blind.config.blind.boss.showdown then
        -- Equivalent to context.main_eval, which doesn't exist for decks
        if not context.repetition and not context.individual then
          PB_UTIL.add_tag('tag_negative', nil, false)
        end
      end
    end
  }
end
