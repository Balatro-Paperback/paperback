if PB_UTIL.config.enhancements_enabled then
  PB_UTIL.Sleeve {
    key       = 'potters',
    deck_buff = 'b_paperback_potters',
    atlas     = 'card_sleeves_atlas',
    pos       = { x = 6, y = 0 },
    unlocked = false,
    unlock_condition = { deck = "b_paperback_potters", stake = "stake_black" },

    loc_vars = function(self)
      return {
        key = self:loc_key(),
        vars = self:is_buffed() and {
          localize { type = 'name_text', key = 'v_seed_money', set = 'Voucher' },
          localize { type = 'name_text', key = 'v_money_tree', set = 'Voucher' }
        }
      }
    end,

    apply = function(self, sleeve)
      if self:is_buffed() then
        G.GAME.used_vouchers['v_seed_money'] = true
        G.GAME.used_vouchers['v_money_tree'] = true
        G.GAME.starting_voucher_count = (G.GAME.starting_voucher_count or 0) + 2
        G.E_MANAGER:add_event(Event({ 
          func = function()
            Card.apply_to_run(nil, G.P_CENTERS['v_seed_money'])
            Card.apply_to_run(nil, G.P_CENTERS['v_money_tree'])
            return true
          end
        }))
      else
        SMODS.Back.obj_table[self.deck_buff].apply(self)
      end
    end,

    calculate = function(self, sleeve, context)
      if not self:is_buffed() then
        return SMODS.Back.obj_table[self.deck_buff].calculate(self, sleeve, context)
      end
    end
  }
end