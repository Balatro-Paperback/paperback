SMODS.Joker {
  key = "nigori",
  config = {
    extra = {
      current = 1.3,
      gain = 0.1,
      floor = 1.0,
      suit = "paperback_Stars",
      upgrade = { type = 'variable', key = 'a_xchips', colour = G.C.CHIPS },
      downgrade_req = 2,
    }
  },
  rarity = 3,
  pos = { x = 24, y = 1 },
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
  paperback = {
    requires_stars = true
  },

  loc_vars = PB_UTIL.suit_drink_loc_vars,
  calculate = PB_UTIL.suit_drink_logic,
  paperback_suit_drink_effect = function(card, other_card)
    return {
      xchips = card.ability.extra.current,
      message_card = card
    }
  end
}
