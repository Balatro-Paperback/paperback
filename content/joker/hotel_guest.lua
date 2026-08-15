local j = SMODS.Joker {
  key = 'hotel_guest',
  config = {
    extra = {
      mult_per_queen = 0.5,
    }
  },
  attributes = {
    'xmult',
    'rank',
    'queen',
  },
  pos = { x = 24, y = 11 },
  soul_pos = { x = 23, y = 11 },
  rarity = 3,
  atlas = "jokers_atlas",
  cost = 5,
  unlocked = false,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,
  paperback_credit = {
    coder = { 'dowfrin' },
  },
  paperback = {
    undersoul_pos = { x = 25, y = 11 },
  },

  check_for_unlock = function (self, args)
    for _, v in ipairs(G.playing_cards or {}) do
      if PB_UTIL.is_rank(v, 12) and SMODS.has_enhancement(v, 'm_steel') then
        return true
      end
    end
  end,

  loc_vars = function(card, info_queue, card)
    local queens = 0
    if G.hand then
      for k, v in pairs(G.hand.cards) do
        if PB_UTIL.is_rank(v, 12) and not v.highlighted then queens = queens + 1 end
      end
    end

    return {
      vars = {
        card.ability.extra.mult_per_queen,
        1 + (queens * card.ability.extra.mult_per_queen),
      }
    }
  end,

  calculate = function(card, card, context)
    if context.joker_main then
      local queens = 0
      if G.hand then
        for k, v in pairs(G.hand.cards) do
          if PB_UTIL.is_rank(v, 12) and not v.highlighted then queens = queens + 1 end
        end
      end

      return {
        xmult = 1 + (queens * card.ability.extra.mult_per_queen),
      }
    end
  end,
}
