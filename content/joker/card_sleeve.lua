SMODS.Joker {
  key = "card_sleeve",
  rarity = 1,
  pos = { x = 18, y = 8 },
  atlas = "jokers_atlas",
  cost = 4,
  blueprint_compat = false,
  eternal_compat = false,
  perishable_compat = true,

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = { key = 'eternal', set = 'Other' }
  end,

  calculate = function(self, card, context)
    if context.selling_self and not context.blueprint then
      local other_joker = nil
      for i = 1, #G.jokers.cards do
        if G.jokers.cards[i] == card then other_joker = G.jokers.cards[i + 1] end
      end
      if other_joker ~= nil then
        other_joker:set_eternal(true)
      end
    end
  end
}
