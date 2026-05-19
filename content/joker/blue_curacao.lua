SMODS.Joker {
  key = "blue_curacao",
  config = {
    extra = {
      amount = 6,
      remaining = 5,
      upgrade = "perma_mult",
      suit = "Clubs",
    }
  },
  attributes = {
    'mult',
    'modify_card',
    'perma_bonus',
    'suit',
    'clubs',
    'food'
  },
  rarity = 2,
  pos = { x = 23, y = 9 },
  atlas = "jokers_atlas",
  cost = 6,
  unlocked = true,
  perishable_compat = false,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = false,
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
