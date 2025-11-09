SMODS.Joker {
  key = "everything_must_go",
  config = {
    extra = {
      num_slots = 1
    }
  },
  rarity = 2,
  pos = { x = 14, y = 10 },
  atlas = "jokers_atlas",
  cost = 6,
  blueprint_compat = false,
  eternal_compat = true,
  perishable_compat = true,
  unlocked = false,
  locked_loc_vars = function(self, info_queue)
    return { vars = { 20 } }
  end,
  check_for_unlock = function(self, args)
    if G.P_CENTER_POOLS["Voucher"] then
      local count = 0
      for k, v in pairs(G.P_CENTER_POOLS["Voucher"]) do
        if v.discovered == true then
          count = count + 1
        end
      end
      if count >= 20 then unlock_card(self) end
    end
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
