SMODS.Joker {
  key = "blue_curacao",
  config = {
    extra = {
      current = 6,
      gain = 2,
      floor = 0,
      suit = "Clubs",
      upgrade = { type = 'variable', key = 'a_mult', colour = G.C.MULT }
    }
  },
  rarity = 3,
  pos = { x = 23, y = 9 },
  atlas = "jokers_atlas",
  cost = 9,
  unlocked = true,
  perishable_compat = false,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = false,
  soul_pos = nil,
  pools = {
    Food = true
  },

  loc_vars = PB_UTIL.suit_drink_loc_vars,
  calculate = PB_UTIL.suit_drink_logic,
  paperback_suit_drink_effect = function(card, other_card)
    return {
      mult = card.ability.extra.current,
      message_card = other_card
    }
  end
}
