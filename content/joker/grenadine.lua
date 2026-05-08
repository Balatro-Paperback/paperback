SMODS.Joker {
  key = "grenadine",
  config = {
    extra = {
      amount = 0.2,
      suit = "Hearts",
      remaining = 5,
      upgrade = "perma_x_mult",
    }
  },
  attributes = {
    'xmult',
    'modify_card',
    'perma_bonus',
    'suit',
    'hearts',
    'food',
    'red'
  },
  rarity = 2,
  pos = { x = 23, y = 10 },
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
    coder = { 'dowfrin' },
  },

  calculate = PB_UTIL.suit_drink_calculate,

  loc_vars = PB_UTIL.suit_drink_loc_vars
}
