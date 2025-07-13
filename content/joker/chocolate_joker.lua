SMODS.Joker {
  key = 'chocolate_joker',
  config = {
    extra = {
      a_xchips = 0.2,
    }
  },
  rarity = 2,
  pos = { x = 19, y = 4 },
  atlas = 'jokers_atlas',
  cost = 8,
  unlocked = true,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,
  soul_pos = nil,

  loc_vars = function(self, info_queue, card)
    local xchips
    if G.jokers then xchips = 1 + (#G.jokers.cards * card.ability.extra.a_xchips) end
    return {
      vars = {
        card.ability.extra.a_xchips,
        xchips or 1
      }
    }
  end,

  calculate = function(self, card, context)
    if context.joker_main then
      return {
        xchips = 1 + (#G.jokers.cards * card.ability.extra.a_xchips)
      }
    end
  end
}
