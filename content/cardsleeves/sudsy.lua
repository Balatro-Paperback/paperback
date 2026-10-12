PB_UTIL.Sleeve {
  key       = 'sudsy',
  deck_buff = 'b_paperback_sudsy',
  atlas     = 'card_sleeves_atlas',
  pos       = { x = 8, y = 0 },
  config = {
    extra = {
      mod_joker_slots = 1,
      mod_hand_size = -1,
      cur_hand_size = 0,
      max_hand_size = -7
    }
  },
  unlocked = false,
  unlock_condition = { deck = "b_paperback_sudsy", stake = "stake_purple" },

  loc_vars = function(self)
    return {
      key = self:loc_key(),
      vars = self:is_buffed() and {
        localize { type = 'name_text', key = 'tag_top_up', set = 'Tag' }
      } or {
        PB_UTIL.force_signed(self.config.extra.mod_joker_slots), 
        PB_UTIL.force_signed(self.config.extra.mod_hand_size), 
        PB_UTIL.force_signed(self.config.extra.max_hand_size)
      }
    }
  end,

  calculate = function(self, sleeve, context)
    if not self:is_buffed() then
      return SMODS.Back.obj_table[self.deck_buff].calculate(self, sleeve, context)
    end

    if context.round_eval and G.GAME.last_blind and G.GAME.last_blind.boss then
      PB_UTIL.add_tag('tag_top_up', nil, false)
    end
  end

}
