SMODS.Joker {
  key = "shuttle",
  config = {
    extra = {
      max = 10,
      multiplier = 2
    }
  },
  attributes = {
    'economy',
    'hand_type'
  },
  rarity = 1,
  pos = { x = 15, y = 11 },
  atlas = "jokers_atlas",
  cost = 6,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,
  paperback_credit = {
    coder = { 'thermo' }
  },
  unlocked = false,

  locked_loc_vars = function (self, info_queue, card)
    return { vars = { 9 }}
  end,

  check_for_unlock = function (self, args)
    if args.type == 'upgrade_hand' then
      local hands = G.GAME.hands
      local count = 0
      for _, v in pairs(hands) do
        if v.level >= 2 then count = count + 1 end
      end
      return count >= 9
    end
  end,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.max
      }
    }
  end,

  calculate = function(self, card, context)
    if context.first_hand_drawn and not context.blueprint then
      local eval = function() return G.GAME.current_round.hands_played == 0 and not G.RESET_JIGGLES end
      juice_card_until(card, eval, true)
    end
    if context.joker_main and G.GAME.current_round.hands_played == 0 then
      local money = 0
      money = math.min(to_number(G.GAME.hands[context.scoring_name].level) * card.ability.extra.multiplier,
        card.ability.extra.max)
      if money > 0 then
        return {
          dollars = money
        }
      end
    end
  end
}
