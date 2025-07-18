SMODS.Joker {
  key = "inner_peace",
  rarity = 2,
  config = {
    extra = {
      h_size = 3
    }
  },
  pos = { x = 10, y = 4 },
  atlas = 'jokers_atlas',
  cost = 6,
  blueprint_compat = false,
  eternal_compat = true,
  perishable_compat = true,

  set_ability = function(self, card, initial, delay_sprites)
    card.ability.h_size = card.ability.extra.h_size or 0
  end,

  loc_vars = function(self, info_queue, card)
    return {
      vars = { card.ability.h_size }
    }
  end,

  calculate = function(self, card, context)
    if context.before and card.ability.h_size > 0 and not context.blueprint then
      G.hand:change_size(-card.ability.h_size)
      card.ability.h_size = 0
    end

    if context.end_of_round and context.main_eval and not context.blueprint and card.ability.h_size == 0 then
      card.ability.h_size = card.ability.extra.h_size
      G.hand:change_size(card.ability.h_size)
    end
  end
}
