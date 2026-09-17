if PB_UTIL.config.enhancements_enabled then
  SMODS.Back {
    key = 'potters',
    atlas = 'decks_atlas',
    pos = { x = 8, y = 0 },
    unlocked = false,
    locked_loc_vars = function(self, info_queue, card)
      return {
        vars = {
          100,
          PB_UTIL.get_career_stat("paperback_cards_destroyed", 0)
        }
      }
    end,
    check_for_unlock = function(self, args)
      return args.type == "paperback_cards_destroyed" and args.total >= 100
    end,
    apply = function(self, back)
      G.E_MANAGER:add_event(Event({
        func = function()
          for _, v in ipairs(G.playing_cards) do
            v:set_ability(G.P_CENTERS["m_paperback_ceramic"])
          end
          return true
        end
      }))
    end,
    calculate = function(self, back, context)
      if context.setting_blind then
        G.E_MANAGER:add_event(Event({
          trigger = 'after',
          delay = 0.4,
          func = function()
            if G.GAME.dollars ~= 0 then
              ease_dollars(-G.GAME.dollars, true)
            end
            return true
          end
        }))
      end
    end
  }
end
