SMODS.Joker {
  key = 'tome',
  rarity = 2,
  pos = { x = 17, y = 5 },
  atlas = 'jokers_atlas',
  cost = 6,
  unlocked = true,
  discovered = false,
  blueprint_compat = false,
  eternal_compat = true,
  perishable_compat = true,
  config = { extra = { slots_per = 1, slots = 1 } },

  loc_vars = function(self, info_queue, card)
    return { vars = {
      card.ability.extra.slots_per,
      card.ability.extra.slots,
      card.ability.extra.slots == 1 and "" or "s",
    } }
  end,

  add_to_deck = function(self, card, from_debuff)
    G.consumeables:change_size(card.ability.extra.slots)
  end,

  remove_from_deck = function(self, card, from_debuff)
    G.consumeables:change_size(-card.ability.extra.slots)
  end,

  update = function(self, card, dt)
    if G.jokers then
      -- Count the unique rarities using a set
      local rarity_set = {}
      local count = 0
      for _, joker in ipairs(G.jokers.cards) do
        if not rarity_set[joker.config.center.rarity] then
          rarity_set[joker.config.center.rarity] = true
          count = count + 1
        end
      end
      if not rarity_set[card.config.center.rarity] then
        rarity_set[card.config.center.rarity] = true
        count = count + 1
      end

      -- Update consumable limit
      if card.added_to_deck then
        local change = count - card.ability.extra.slots
        if change ~= 0 then
          G.consumeables:change_size(change)
        end
      end
      card.ability.extra.slots = count
    end
  end
}
