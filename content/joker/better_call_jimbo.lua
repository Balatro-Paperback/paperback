SMODS.Joker {
  key = 'better_call_jimbo',
  config = {
    extra = {
      a_xMult = 0.1,
      threshold = 4
    },
  },
  rarity = 3,
  pos = { x = 18, y = 5 },
  atlas = 'jokers_atlas',
  cost = 8,
  unlocked = true,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.a_xMult,
        card.ability.extra.threshold,
        1 + math.max(0,
          card.ability.extra.a_xMult * math.floor(G.GAME.dollars / card.ability.extra.threshold))
      }
    }
  end,

  calculate = function(self, card, context)
    if context.joker_main then
      return {
        x_mult = 1 + math.max(0,
          card.ability.extra.a_xMult * math.floor(G.GAME.dollars / card.ability.extra.threshold))
      }
    end
  end
}
