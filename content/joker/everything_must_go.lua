SMODS.Joker {
  key = "everything_must_go",
  config = {
    extra = {
      numSlots = 1
    }
  },
  rarity = 2,
  pos = { x = 14, y = 10 },
  atlas = "jokers_atlas",
  cost = 6,
  blueprint_compat = false,
  eternal_compat = true,
  perishable_compat = true,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.numSlots
      }
    }
  end,

  add_to_deck = function(self, card, from_debuff)
    SMODS.change_voucher_limit(card.ability.extra.numSlots)
  end,


  remove_from_deck = function(self, card, from_debuff)
    SMODS.change_voucher_limit(-card.ability.extra.numSlots)
  end,
}
