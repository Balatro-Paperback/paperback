SMODS.Joker {
  key = "lager",
  config = {
    extra = {
      current = 1,
      gain = 1,
      floor = -1,
      suit = "paperback_Crowns",
      upgrade = { type = 'variable', key = 'paperback_a_plus_consumable_slot' },
      downgrade_req = 2,
    }
  },
  rarity = 3,
  pos = { x = 24, y = 2 },
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
    requires_crowns = true
  },

  loc_vars = PB_UTIL.suit_drink_loc_vars,
  calculate = PB_UTIL.suit_drink_logic,

  add_to_deck = function(self, card, from_debuff)
    G.consumeables:change_size(card.ability.extra.current)
  end,

  remove_from_deck = function(self, card, from_debuff)
    G.consumeables:change_size(-card.ability.extra.current)
  end,

  paperback_lager_effect = function(card, other_card, upgraded, upgrade)
    G.consumeables:change_size(upgraded)
    return upgrade
  end
}
