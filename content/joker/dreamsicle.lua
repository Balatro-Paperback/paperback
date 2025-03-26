SMODS.Joker {
  key = "dreamsicle",
  config = {
    extra = {
      mult = 5,
      odds = 4,
      suit = 'Diamonds',
      stick_key = 'j_paperback_popsicle_stick'
    }
  },
  rarity = 1,
  pos = { x = 8, y = 2 },
  atlas = 'jokers_atlas',
  cost = 6,
  unlocked = true,
  discovered = true,
  blueprint_compat = true,
  eternal_compat = false,
  soul_pos = nil,
  yes_pool_flag = "dreamsicle_can_spawn",
  pools = {
    Food = true
  },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.mult,
        G.GAME.probabilities.normal,
        card.ability.extra.odds
      }
    }
  end,

  calculate = PB_UTIL.stick_food_joker_logic,
  joker_display_def = PB_UTIL.stick_food_joker_display_def,
}
