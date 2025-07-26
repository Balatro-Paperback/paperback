SMODS.Joker {
  key = 'determination',
  config = {
    extra = {
      delta = -1,
    }
  },
  rarity = 3,
  pos = { x = 16, y = 9 },
  atlas = 'jokers_atlas',
  cost = 7,
  unlocked = true,
  discovered = false,
  blueprint_compat = false,
  eternal_compat = false,
  perishable_compat = false,
  soul_pos = nil,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.delta,
      }
    }
  end,

  calculate = function(self, card, context)
    if not context.blueprint and context.end_of_round and context.game_over then
      PB_UTIL.destroy_joker(card)
      ease_ante(card.ability.extra.delta)
      G.hand:change_size(card.ability.extra.delta)
      return {
        message = localize('paperback_determination_ex'),
        saved = 'paperback_saved_determination',
        colour = G.C.MULT
      }
    end
  end
}
