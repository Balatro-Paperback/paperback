if PB_UTIL.config.minor_arcana_enabled and PB_UTIL.config.vouchers_enabled then
  SMODS.Back {
    key = 'silver',
    atlas = 'decks_atlas',
    pos = { x = 2, y = 0 },
    unlocked = false,
    config = {
      vouchers = {
        'v_paperback_celtic_cross'
      },
      consumables = {
        'c_paperback_nine_of_cups'
      }
    },

    loc_vars = function(self, info_queue)
      return {
        vars = {
          localize { type = 'name_text', key = 'v_paperback_celtic_cross', set = 'Voucher' },
          localize { type = 'name_text', key = 'c_paperback_nine_of_cups', set = 'paperback_minor_arcana' }
        }
      }
    end,
    locked_loc_vars = function(self, info_queue)
      return { vars = { 20 } }
    end,
    check_for_unlock = function(self, args)
      if G.P_CENTER_POOLS["paperback_minor_arcana"] then
        local count = 0
        for k, v in pairs(G.P_CENTER_POOLS["paperback_minor_arcana"]) do
          if v.discovered == true then
            count = count + 1
          end
        end
        if count >= 20 then
          unlock_card(self)
        end
      end
    end
  }
end
