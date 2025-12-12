SMODS.Joker {
  key = "stout",
  config = {
    extra = {
      current = 45,
      gain = 15,
      floor = 0,
      suit = "Spades",
      upgrade = { type = 'variable', key = 'a_chips', colour = G.C.CHIPS }
    }
  },
  rarity = 3,
  pos = { x = 23, y = 8 },
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
      chips = card.ability.extra.current,
      message_card = other_card
    }
  end
}
