SMODS.Joker {
  key = "57_leaf_clover",
  config = {
    extra = {
      gain = 1,
      current = 1,
    },
  },
  rarity = 3,
  pos = { x = 24, y = 4 },
  atlas = "jokers_atlas",
  cost = 7,
  unlocked = true,
  discovered = false,
  blueprint_compat = false,
  eternal_compat = true,
  perishable_compat = true,
  soul_pos = nil,

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.current, card.ability.extra.gain } }
  end,

  calculate = function(self, card, context)
    if context.blueprint then return end
    if context.mod_probability then
      return { numerator = context.numerator + card.ability.extra.current }
    end
    if context.end_of_round and context.main_eval then
      if G.GAME.blind.boss then
        card.ability.extra.current = 1
        return { message = localize('k_reset') }
      else
        card.ability.extra.current = card.ability.extra.current + card.ability.extra.gain
        return {
          message = localize('paperback_plus_odds'),
          colour = G.C.GREEN,
        }
      end
    end
  end
}
