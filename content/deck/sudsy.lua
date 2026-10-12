SMODS.Back {
  key = 'sudsy',
  atlas = 'decks_atlas',
  pos = { x = 9, y = 0 },
  config = {
    extra = {
      mod_joker_slots = 1,
      mod_hand_size = -1,
      cur_hand_size = 0,
      max_hand_size = -7
    }
  },
  unlocked = false,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        PB_UTIL.force_signed(self.config.extra.mod_joker_slots), 
        PB_UTIL.force_signed(self.config.extra.mod_hand_size), 
        PB_UTIL.force_signed(self.config.extra.max_hand_size)
      }
    }
  end,
  calculate = function (self, back, context)
    if context.round_eval and G.GAME.last_blind and G.GAME.last_blind.boss then
      G.E_MANAGER:add_event(Event({
        func = function()
            G.jokers.config.card_limit = G.jokers.config.card_limit + self.config.extra.mod_joker_slots
            if not (self.config.extra.cur_hand_size <= self.config.extra.max_hand_size) then
              G.hand:change_size(self.config.extra.mod_hand_size)
              self.config.extra.cur_hand_size = self.config.extra.cur_hand_size + self.config.extra.mod_hand_size
            end
            return true
        end
      }))
    end
  end,
  locked_loc_vars = function(self, info_queue, back)
    return {
      vars = {
        5,
        localize { type = 'name_text', set = 'Stake', key = 'stake_purple' },
        colours = { get_stake_col(6) }
      }
    }
  end,
  check_for_unlock = function(self, args)
    if args.type == 'win_stake' then
      local needed_level = G.P_STAKES["stake_purple"].stake_level
      local count = 0
      for _, v in ipairs(G.P_CENTER_POOLS.Back) do
        local sticker = get_deck_win_sticker(v)
        if sticker then
          local stake = G.P_STAKES["stake_" .. sticker]
          if stake and (stake.stake_level or 0) >= needed_level then
            count = count + 1
          end
        end
      end
      if count >= 5 then return true end
    end
  end,
}
