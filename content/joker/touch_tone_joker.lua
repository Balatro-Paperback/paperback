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
  pools = {
    Music = true
  },
  rarity = 2,
  pos = { x = 11, y = 9 },
  atlas = "jokers_atlas",
  cost = 8,
  unlocked = true,
  discovered = false,
  blueprint_compat = false,
  eternal_compat = true,
  perishable_compat = true,

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
