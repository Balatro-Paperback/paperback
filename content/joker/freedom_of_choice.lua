SMODS.Joker {
  key = "freedom_of_choice",
  unlocked = false,
  config = {
    extra = {
      poker_hands = 'Five of a Kind',
      a_xmult = 0.05,
      upgrade = "perma_x_mult"
    }
  },
  attributes = {
    'red',
    'xmult',
    'modify_card',
    'perma_bonus',
    'hand_type'
  },
  rarity = 3,
  pos = { x = 11, y = 12 },
  atlas = "jokers_atlas",
  cost = 8,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,
  paperback_credit = {
    coder = { "thermo" },
    artist = { "thermo" }
  },
  
  check_for_unlock = function(self, args)
    if args.type == 'paperback_played_flush_five_hearts' then
      return true
    end
  end,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        localize(card.ability.extra.poker_hands, 'poker_hands'),
        card.ability.extra.a_xmult
      },
    }
  end,

  in_pool = function(self, args)
    -- Only in pool if you have played a Five of a Kind or a Flush Five
    return PB_UTIL.any_hand_played { "Five of a Kind", "Flush Five", "Spectrum Five" }
  end,

  calculate = function(self, card, context)
    if context.before and context.main_eval and next(context.poker_hands[card.ability.extra.poker_hands]) then
      for _, scored_card in ipairs(context.scoring_hand) do
        scored_card.ability[card.ability.extra.upgrade] = (scored_card.ability[card.ability.extra.upgrade] or 1) +
            card.ability.extra.a_xmult
      end
      return {
        message = localize('k_upgrade_ex'),
        colour = G.C.RED
      }
    end
  end
}
