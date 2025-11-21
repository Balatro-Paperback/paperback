SMODS.Joker {
  key = 'protocol',
  rarity = 1,
  pos = { x = 12, y = 6 },
  atlas = 'jokers_atlas',
  cost = 5,
  unlocked = true,
  discovered = false,
  blueprint_compat = false,
  eternal_compat = true,
  perishable_compat = true,
  config = { extra = { pack_size = 1 } },

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.pack_size } }
  end,

  add_to_deck = function(self, card, from_debuff)
    G.GAME.modifiers.booster_size_mod = (G.GAME.modifiers.booster_size_mod or 0) + card.ability.extra.pack_size
  end,

  remove_from_deck = function(self, card, from_debuff)
    G.GAME.modifiers.booster_size_mod = (G.GAME.modifiers.booster_size_mod or 0) - card.ability.extra.pack_size
  end
}
