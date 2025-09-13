SMODS.Joker {
  key = "fodder",
  rarity = 1,
  pos = { x = 12, y = 5 },
  atlas = "jokers_atlas",
  cost = 4,
  blueprint_compat = false,
  eternal_compat = false,
  perishable_compat = true,
  paperback = {
    requires_ego_gifts = true
  },

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = { key = 'paperback_corroded', set = 'Other', vars = { G.GAME.paperback.corroded_rounds, G.GAME.paperback.corroded_rounds } }
  end,

  calculate = function(self, card, context)
    if context.selling_self and not context.blueprint then
      local gift = nil
      for i = 1, #G.consumeables.cards do
        if G.consumeables.cards[i].ability.sin and not G.consumeables.cards[i].ability.paperback_corroded
        then
          gift = G.consumeables.cards[i]
        end
      end
      if gift then
        gift:add_sticker('paperback_corroded', true)
        PB_UTIL.set_base_sell_value(gift, 0)
      end
    end
  end
}
