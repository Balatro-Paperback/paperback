SMODS.Joker {
  key = "everything_must_go",
  config = {
    extra = {
      num_slots = 1
    }
  },
  attributes = {
    'passive',
    'shop'
  },
  rarity = 2,
  pos = { x = 14, y = 10 },
  atlas = "jokers_atlas",
  cost = 6,
  blueprint_compat = false,
  eternal_compat = true,
  perishable_compat = true,
  unlocked = false,
  paperback_credit = {
    coder = { 'infinityplus' },
  },

  locked_loc_vars = function(self, info_queue)
    return { vars = { 4 } }
  end,
  check_for_unlock = function(self, args)
    local count = 0
    if G.vouchers then
      for _, v in ipairs(G.vouchers.cards or {}) do
        if v.config.center.requires and type(v.config.center.requires) == "table" then
          count = count + 1
        end
      end
    end
    return count >= 4
  end,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.num_slots
      }
    }
  end,

  add_to_deck = function(self, card, from_debuff)
    SMODS.change_voucher_limit(card.ability.extra.num_slots)
  end,

  remove_from_deck = function(self, card, from_debuff)
    SMODS.change_voucher_limit(-card.ability.extra.num_slots)
  end,
}
