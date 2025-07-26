SMODS.Joker {
  key = 'golden_egg',
  rarity = 3,
  pos = { x = 16, y = 8 },
  atlas = 'jokers_atlas',
  cost = 8,
  unlocked = false,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,

  check_for_unlock = function(self, args)
    if args.type == 'win' then
      local most_played = to_big(0)
      for name, vals in pairs(G.GAME.hands) do
        if to_big(vals.played) > most_played then most_played = to_big(vals.played) end
      end
      for i, v in ipairs(G.GAME.paperback.secret_hands) do
        if to_big(G.GAME.hands[v].played) == most_played then return true end
      end
    end
    return false
  end,

  in_pool = function(self, args)
    for i, v in ipairs(G.GAME.paperback.secret_hands) do
      if to_big(G.GAME.hands[v].played) > to_big(0) then return true end
    end
    return false
  end,

  calculate = function(self, card, context)
    if context.joker_main then
      for i, v in ipairs(G.GAME.paperback.secret_hands) do
        if v == context.scoring_name then
          local other_joker = nil
          for i = 1, #G.jokers.cards do
            if G.jokers.cards[i] == card then other_joker = G.jokers.cards[i + 1] end
          end
          if other_joker then
            return { dollars = other_joker.sell_cost }
          end
        end
      end
    end
  end
}
