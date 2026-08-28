SMODS.Joker {
  key = 'freight',
  config = {
    extra = {
      gain = 2,
      discards = 1,
      per_dollar = 2,
    }
  },
  attributes = {
    'economy',
    'sell_value',
    'on_sell',
    'discard',
    'boss_blind'
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
  paperback_credit = {
    coder = { 'vitellary' },
  },

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
      SMODS.scale_card(card, {
        ref_table = card.ability,
        ref_value = 'extra_value',
        scalar_table = card.ability.extra,
        scalar_value = 'gain',
        scaling_message = {
          message = localize('k_val_up'),
          colour = G.C.MONEY
        }
      })
      card:set_cost()
      return nil, true
    end
    if context.selling_self and not context.blueprint then
      local discards = card.ability.extra.discards * math.floor(card.sell_cost / card.ability.extra.per_dollar)
      PB_UTIL.set_sell_value(card, 0)
      ease_discard(discards)
    end
  end,
}
