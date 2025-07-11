SMODS.Joker {
  key = 'wild_plus_four',
  rarity = 3,
  pos = { x = 19, y = 3 },
  atlas = 'jokers_atlas',
  cost = 10,
  unlocked = true,
  discovered = false,
  blueprint_compat = false,
  eternal_compat = true,
  soul_pos = nil,
  config = { extra = { h_size = 4 } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.h_size } }
  end,
  add_to_deck = function(self, card, from_debuff)
    G.hand:change_size(card.ability.extra.h_size)
  end,
  remove_from_deck = function(self, card, from_debuff)
    G.hand:change_size(-card.ability.extra.h_size)
  end
}
