SMODS.Joker {
  key = 'freight',
  config = {
    extra = {
      gain = 2,
      discards = 1,
      per_dollar = 2,
    }
  },
  rarity = 2,
  pos = { x = 19, y = 6 },
  atlas = 'jokers_atlas',
  cost = 8,
  unlocked = true,
  discovered = false,
  blueprint_compat = false,
  eternal_compat = false,
  perishable_compat = true,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.gain,
        card.ability.extra.discards,
        card.ability.extra.per_dollar,
      }
    }
  end,

  calc_dollar_bonus = function(self, card)
    if not G.GAME.blind.boss then
      return card.sell_cost
    end
  end,

  calculate = function(self, card, context)
    if context.end_of_round and G.GAME.blind.boss and context.main_eval and not context.blueprint then
      card.ability.extra_value = (card.ability.extra_value or 0) + card.ability.extra.gain
      card:set_cost()
      return {
        message = localize('k_val_up'),
        colour = G.C.MONEY
      }
    end
    if context.selling_self and not context.blueprint then
      local discards = card.ability.extra.discards * math.floor(card.sell_cost / card.ability.extra.per_dollar)
      PB_UTIL.set_sell_value(card, 0)
      ease_discard(discards)
    end
  end,
}
