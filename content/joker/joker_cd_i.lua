SMODS.Joker {
  key = "joker_cd_i",
  config = {
    extra = {
      odds = 2,
      cards = 4,
    }
  },
  rarity = 1,
  pos = { x = 10, y = 9 },
  atlas = "jokers_atlas",
  cost = 3,
  unlocked = true,
  discovered = true,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        G.GAME.probabilities.normal,
        card.ability.extra.odds,
        card.ability.extra.cards
      }
    }
  end,

  calculate = function(self, card, context)
    if context.before and context.main_eval and #context.full_hand == card.ability.extra.cards then
      if PB_UTIL.try_spawn_card { set = 'Planet' } then
        return {
          message = localize('k_plus_planet'),
          colour = G.C.SECONDARY_SET.Planet
        }
      end
    end
  end
}
