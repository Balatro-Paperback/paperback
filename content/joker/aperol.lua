SMODS.Joker {
  key = "aperol",
  config = {
    extra = {
      current = 2,
      gain = 1,
      floor = 0,
      suit = "Diamonds",
      upgrade = { type = 'variable', key = 'paperback_a_dollars', colour = G.C.GOLD }
    }
  },
  rarity = 3,
  pos = { x = 24, y = 0 },
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
      dollars = card.ability.extra.current,
      message_card = other_card
    }
  end
}
