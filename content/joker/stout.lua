SMODS.Joker {
  key = "stout",
  config = {
    extra = {
      amount = 30,
      suit = "Spades",
      remaining = 5,
      upgrade = "perma_bonus",
    }
  },
  attributes = {
    'chips',
    'modify_card',
    'perma_bonus',
    'suit',
    'spades',
    'food'
  },
  rarity = 2,
  pos = { x = 23, y = 8 },
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

  paperback_credit = {
    coder = { 'dowfrin' }
  },

  calculate = PB_UTIL.suit_drink_calculate,

  loc_vars = PB_UTIL.suit_drink_loc_vars
}
