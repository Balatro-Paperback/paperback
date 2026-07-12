SMODS.Joker {
  key = "freedom_of_choice",

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
    for k, v in pairs(G.GAME.hands) do
      if string.find(k, "Five of a Kind", nil, true) or string.find(k, "Flush Five", nil, true) or string.find(k, "Spectrum Five", nil, true) then
        if G.GAME.hands[k].played > 0 then
          return true
        end
      end
    end
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
