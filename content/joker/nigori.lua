SMODS.Joker {
  key = "nigori",
  config = {
    extra = {
      amount = 0.3,
      remaining = 5,
      upgrade = "perma_x_chips",
      suit = "paperback_Stars",
    }
  },
  attributes = {
    'xchips',
    'modify_card',
    'perma_bonus',
    'suit',
    'stars',
    'food'
  },
  rarity = 2,
  pos = { x = 24, y = 1 },
  atlas = "jokers_atlas",
  cost = 6,
  unlocked = true,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = false,
  perishable_compat = false,
  soul_pos = nil,
  pools = {
    Food = true
  },
  paperback = {
    requires_stars = true,
  },

  paperback_credit = {
    coder = { 'dowfrin' },
  },

  calculate = PB_UTIL.suit_drink_calculate,

  loc_vars = PB_UTIL.suit_drink_loc_vars
}
