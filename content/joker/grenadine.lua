SMODS.Joker {
  key = "grenadine",
  config = {
    extra = {
      current = 1.15,
      gain = 0.05,
      floor = 1.0,
      suit = "Hearts",
      upgrade = { type = 'variable', key = 'a_xmult', colour = G.C.MULT }
    }
  },
  rarity = 3,
  pos = { x = 23, y = 10 },
  atlas = "jokers_atlas",
  cost = 9,
  unlocked = true,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = false,
  perishable_compat = false,
  soul_pos = nil,
  pools = {
    Food = true
  },

  loc_vars = PB_UTIL.suit_drink_loc_vars,
  calculate = PB_UTIL.suit_drink_logic,
  paperback_suit_drink_effect = function(card, other_card)
    return {
      xmult = card.ability.extra.current,
      message_card = other_card
    }
  end
}
