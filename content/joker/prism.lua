SMODS.Joker {
  key = "prism",
  config = {
    extra = {
      hand = 'Flush'
    }
  },
  rarity = 2,
  pos = { x = 11, y = 6 },
  atlas = "jokers_atlas",
  cost = 6,
  blueprint_compat = false,
  eternal_compat = true,
  perishable_compat = true,
  paperback = {
    requires_custom_suits = true,
    requires_spectrum_or_suit = true
  },
  unlocked = false,
  locked_loc_vars = function(self, info_queue, card)
    return { vars = { 5 } }
  end,
  -- Just took the vanilla unlock condition for the Flushed achievement
  check_for_unlock = function(self, args)
    if args.type == 'hand' then
      if args.handname == 'Flush' and args.scoring_hand then
        local _w = 0
        for k, v in ipairs(args.scoring_hand) do
          if v.ability.name == 'Wild Card' then
            _w = _w + 1
          end
        end
        if _w == #args.scoring_hand then
          return true
        end
      end
    end
  end,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        localize(card.ability.extra.hand, 'poker_hands')
      }
    }
  end,

  calculate = function(self, card, context)
    if not context.blueprint and context.after and context.main_eval and next(context.poker_hands[card.ability.extra.hand]) then
      local played_suits = {}

      for _, v in ipairs(context.scoring_hand) do
        if not SMODS.has_no_suit(v) then
          played_suits[v.base.suit] = true
        end
      end

      local available_suits = {}

      for k, v in pairs(SMODS.Suits) do
        if not played_suits[k] then
          available_suits[k] = v
        end
      end

      PB_UTIL.use_consumable_animation(card, context.scoring_hand, function()
        for _, v in ipairs(context.scoring_hand) do
          local _, suit = pseudorandom_element(available_suits, pseudoseed("prism"), {
            paperback = {
              include_stars = true,
              include_crowns = true
            }
          })

          if suit then
            available_suits[suit] = nil
            assert(SMODS.change_base(v, suit))
          end
        end
      end)

      return nil, true
    end
  end
}
