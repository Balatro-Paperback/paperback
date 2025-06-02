SMODS.Joker {
  key = "as_above_so_below",
  rarity = 2,
  pos = { x = 0, y = 0 }, -- TODO: CHANGE WHEN SPRITE IS ADDED TO ATLAS
  atlas = "jokers_atlas",
  cost = 6,
  unlocked = false,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,
  paperback = {
    requires_ranks = true
  },

  in_pool = function(self, args)
    for _, v in ipairs(G.playing_cards or {}) do
      if v:get_id() == SMODS.Ranks['paperback_Apostle'].id then
        return true
      end
    end
  end,

  check_for_unlock = function(self, args)
    if args.type == 'hand' then
      if args.handname == 'Straight Flush' then
        -- if hand contains Straight Flush and an Apostle, it is a rapture
        for _, card in pairs(args.scoring_hand) do
          if card:get_id() == SMODS.Ranks['paperback_Apostle'].id then
            return true
          end
        end
      end
    end
  end,

  calculate = function(self, card, context)
    if context.before and #context.scoring_hand == 5 then
      local apostle = false
      -- Check for apostle
      for _, v in ipairs(context.scoring_hand) do
        if v:get_id() == SMODS.Ranks['paperback_Apostle'].id then
          apostle = true
          break
        end
      end
      if apostle then
        if not next(context.poker_hands["Straight"]) then
          if PB_UTIL.try_spawn_card { set = 'Tarot' } then
            return {
              message = localize('k_plus_tarot'),
              colour = G.C.SECONDARY_SET.Tarot
            }
          end
        else
          if PB_UTIL.try_spawn_card { set = 'Spectral' } then
            return {
              message = localize('k_plus_spectral'),
              colour = G.C.SECONDARY_SET.Spectral
            }
          end
        end
      end
    end
  end
}
