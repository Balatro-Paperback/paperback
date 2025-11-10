if PB_UTIL.config.minor_arcana_enabled then
  PB_UTIL.Sleeve {
    key = 'antique',
    deck_buff = 'b_paperback_antique',
    atlas = 'card_sleeves_atlas',
    pos = { x = 4, y = 0 },
    unlocked = false,
    unlock_condition = { deck = "b_paperback_antique", stake = "stake_black" },

    calculate = function(self, sleeve, context)
      if self:is_buffed() and (context.starting_shop or context.reroll_shop) then
        -- Make all booster packs free
        for _, v in ipairs(G.shop_booster.cards or {}) do
          if v.config.center.kind == 'paperback_minor_arcana' then
            v.ability.couponed = true
            v:set_cost()
          end
        end
      end
    end
  }
end
