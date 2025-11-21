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
  perishable_compat = true,
  config = { extra = { h_size = 4, hands = -1 } },

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.h_size, card.ability.extra.hands } }
  end,

  add_to_deck = function(self, card, from_debuff)
    G.hand:change_size(card.ability.extra.h_size)
    G.GAME.round_resets.hands = G.GAME.round_resets.hands + card.ability.extra.hands
    ease_hands_played(card.ability.extra.hands)
  end,

  remove_from_deck = function(self, card, from_debuff)
    G.hand:change_size(-card.ability.extra.h_size)
    G.GAME.round_resets.hands = G.GAME.round_resets.hands - card.ability.extra.hands
    ease_hands_played(-card.ability.extra.hands)
  end
}
