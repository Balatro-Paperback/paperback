SMODS.Joker { -- Banana Man
  key = "banana_man",
  config = {
    extra = {
      xmult = 3,
      odds = 3,
    }
  },
  pos = {
    x = 1,
    y = 10
  },
  cost = 8,
  rarity = 3,
  blueprint_compat = true,
  eternal_compat = true,
  unlocked = false,
  discovered = false,
  atlas = 'jokers_atlas',

  loc_vars = function(self, info_queue, card)
    local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'banana_man')
    return { vars = { new_numerator, new_denominator, card.ability.extra.xmult } }
  end,

  calculate = function(self, card, context)
    if context.other_joker and context.other_joker.ability.set == "Joker" then     -- this is just baseball card's code, dont @ me
      if (SMODS.pseudorandom_probability(card, 'Potassium', 1, card.ability.extra.odds, 'j_paperback_banana_man')) then
        return {
          Xmult = card.ability.extra.xmult,
        }
      end
    end
  end,

  check_for_unlock = function(self, args)
    if args.type == 'modify_jokers' and G.jokers then
      if next(SMODS.find_card('j_cavendish')) then
        return true
      end
      return false
    end
  end
}
