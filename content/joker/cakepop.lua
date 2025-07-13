SMODS.Joker {
  key = "cakepop",
  config = {
    extra = {
      mult = 5,
      odds = 4,
      suit = 'Hearts',
      stick_key = 'j_paperback_pop_stick'
    }
  },
  rarity = 1,
  pos = { x = 0, y = 3 },
  atlas = 'jokers_atlas',
  cost = 6,
  unlocked = true,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = false,
  soul_pos = nil,
  yes_pool_flag = "cakepop_can_spawn",
  pools = {
    Food = true
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
