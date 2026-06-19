SMODS.Joker {
  key = "touch_tone_joker",
  config = {
    extra = {
      packs = {
        Spectral = true,
        Arcana = true,
        Celestial = true,
        paperback_minor_arcana = true
      }
    }
  },
  attributes = {
    'tarot',
    'planet',
    'spectral',
    'consumable',
    'booster'
  },
  pools = {
    Music = true
  },
  rarity = 2,
  pos = { x = 11, y = 9 },
  atlas = "jokers_atlas",
  cost = 8,
  unlocked = false,
  discovered = false,
  blueprint_compat = false,
  eternal_compat = true,
  perishable_compat = true,

  paperback_credit = {
    coder = { 'srockw' }
  },

  check_for_unlock = function(self, args)
    if G.P_CENTER_POOLS.Booster then
      local count = 0
      local count2 = 0
      for k, v in pairs(G.P_CENTER_POOLS.Booster) do
        count2 = count2 + 1
        if v.discovered == true then
          count = count + 1
        end
      end
      return count == count2 
    end
  end,

  calculate = function(self, card, context)
    if not context.blueprint and context.open_booster and card.ability.extra.packs[context.card.config.center.kind] then
      G.E_MANAGER:add_event(Event {
        trigger = 'after',
        delay = 1.2,
        func = function()
          if G.pack_cards and #G.pack_cards.cards > 0 then
            draw_card(G.pack_cards, G.consumeables, 90, 'up')
          end
          return true
        end
      })

      return nil, true
    end
  end
}
