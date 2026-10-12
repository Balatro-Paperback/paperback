PB_UTIL.Sleeve {
  key       = 'enchained',
  deck_buff = 'b_paperback_enchained',
  atlas     = 'card_sleeves_atlas',
  pos       = { x = 7, y = 0 },
  unlocked = false,
  unlock_condition = { deck = "b_paperback_enchained", stake = "stake_orange" },
  loc_vars = function(self)
    return {
      key = self:loc_key(),
      vars = {
        localize { type = 'name_text', key = 'v_overstock_norm', set = 'Voucher' }
      }
    }
  end,

  apply = function(self, sleeve)
    if self:is_buffed() then
      local consumables = {}
      for i, v in ipairs(G.P_CENTER_POOLS.Consumeables) do
        consumables[i] = v.key
      end

      pseudoshuffle(consumables, "paperback_enchained")
      for i = math.floor(#consumables / 4), #consumables do
        G.GAME.banned_keys[consumables[i]] = true
      end
    else
      SMODS.Back.obj_table[self.deck_buff].apply(self, sleeve)
    end
  end

}