if PB_UTIL.config.suits_enabled then
  SMODS.Back {
    key = 'proud',
    atlas = 'decks_atlas',
    pos = { x = 1, y = 0 },
    paperback = {
      create_crowns = true,
      create_stars = true
    },
    unlocked = false,
    check_for_unlock = function(self, args)
      if args.type == 'hand_contents' then
        local eval = evaluate_poker_hand(args.cards)
        if next(eval['paperback_Spectrum']) then
          return true
        end
      end
      return false
    end,
  }
end
