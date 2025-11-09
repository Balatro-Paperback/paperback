if PB_UTIL.config.minor_arcana_enabled then
  SMODS.Back {
    key = 'antique',
    atlas = 'decks_atlas',
    pos = { x = 4, y = 0 },
    unlocked = false,
    check_for_unlock = function(self, args)
      --Referenced Cryptid for unlock condition
      if G.P_CENTER_POOLS["paperback_minor_arcana"] then
        local count = 0
        local count2 = 0
        for k, v in pairs(G.P_CENTER_POOLS["paperback_minor_arcana"]) do
          count2 = count2 + 1
          if v.discovered == true then
            count = count + 1
          end
        end
        if count == count2 then
          unlock_card(self)
        end
      end
    end
  }
end
