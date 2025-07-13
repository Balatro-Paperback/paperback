SMODS.Joker {
  key = 'tanghulu',
  config = {
    extra = {
      mult = 10,
      odds = 4,
      suit = 'paperback_Crowns',
      stick_key = 'j_paperback_sweet_stick'
    }
  },
  rarity = 1,
  pos = { x = 9, y = 8 },
  atlas = 'jokers_atlas',
  cost = 6,
  unlocked = true,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = false,
  yes_pool_flag = "tanghulu_can_spawn",
  pools = {
    Food = true
  },
  paperback = {
    requires_crowns = true
  },

  loc_vars = function(self, info_queue, card)
    local numerator, denominator = PB_UTIL.chance_vars(card)

    return {
      vars = {
        card.ability.extra.mult,
        numerator,
        denominator
      }
    }
  end,

  calculate = PB_UTIL.stick_food_joker_logic,
  joker_display_def = PB_UTIL.stick_food_joker_display_def,
}
