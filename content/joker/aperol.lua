SMODS.Joker {
  key = "aperol",
  config = {
    extra = {
      suit = "Diamonds",
      amount = 2,
      remaining = 5,
      upgrade = "perma_p_dollars",
    }
  },
  attributes = {
    'economy',
    'modify_card',
    'perma_bonus',
    'suit',
    'diamonds',
    'food'
  },
  rarity = 2,
  pos = { x = 24, y = 0 },
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
    suit_drink = true
  },
  paperback_credit = {
    coder = { 'dowfrin' }
  },

  calculate = PB_UTIL.suit_drink_calculate,

  loc_vars = PB_UTIL.suit_drink_loc_vars
}
