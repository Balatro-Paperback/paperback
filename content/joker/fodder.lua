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
  unlocked = false,
  check_for_unlock = function(self, args)
    if args.type == 'paperback_sold_ego_gifts' then
      return #G.GAME.paperback.sold_ego_gifts >= 1
    end
  end,

  in_pool = function(self, args)
    for _, v in ipairs(G.consumeables or {}) do
      if PB_UTIL.is_ego_gift(v) then return true end
    end
  end,

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = SMODS.Stickers['paperback_corroded']:info_queue_entry()
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
