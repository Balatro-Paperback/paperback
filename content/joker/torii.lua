SMODS.Joker {
  key = "torii",
  config = {
    extra = {
      max = 2,
      current = 0,
      antes = -1,
    },
  },
  rarity = 3,
  pos = { x = 15, y = 0 },
  atlas = "jokers_atlas",
  cost = 8,
  unlocked = true,
  discovered = false,
  blueprint_compat = false,
  eternal_compat = true,
  perishable_compat = true,
  soul_pos = nil,

  loc_vars = function(self, info_queue, card)
    local active, colours
    if G.GAME.paperback.finished_antes[G.GAME.round_resets.ante] then
      active = localize('paperback_inactive')
      colours = { G.C.UI.TEXT_INACTIVE }
    else
      active = localize('k_active')
      colours = { G.C.FILTER }
    end
    return {
      vars = {
        card.ability.extra.antes,
        card.ability.extra.max,
        card.ability.extra.max - card.ability.extra.current,
        active,
        colours = colours,
      }
    }
  end,

  calculate = function(self, card, context)
    if not context.blueprint and context.skip_blind and not G.GAME.paperback.finished_antes[G.GAME.round_resets.ante] then
      card.ability.extra.current = card.ability.extra.current + 1
      if card.ability.extra.current >= card.ability.extra.max then
        card.ability.extra.current = 0
        ease_ante(card.ability.extra.antes)
        G.GAME.round_resets.blind_ante = (G.GAME.round_resets.blind_ante or G.GAME.round_resets.ante) + card.ability.extra.antes
        return {
          message = localize {
            type = 'variable',
            key = 'paperback_a_ante',
            vars = { card.ability.extra.antes },
          }
        }
      else
        return {
          message = localize {
            type = 'variable',
            key = 'paperback_a_completion',
            vars = {
              card.ability.extra.current,
              card.ability.extra.max,
            },
          }
        }
      end
    end
  end
}
