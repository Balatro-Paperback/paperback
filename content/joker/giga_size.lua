SMODS.Joker {
  key = 'giga_size',
  rarity = 3,
  pos = { x = 17, y = 7 },
  atlas = 'jokers_atlas',
  cost = 8,
  unlocked = true,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,
  config = { extra = { xmult = 1, xmult_mod = 1 } },
  soul_pos = nil,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.xmult + card.ability.extra.xmult_mod,
        card.ability.extra.xmult_mod
      }
    }
  end,

  calculate = function(self, card, context)
    if not context.blueprint and context.before then
      card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmult_mod
    end

    if context.joker_main then
      return {
        xmult = card.ability.extra.xmult,
      }
    end

    if not context.blueprint and context.end_of_round and context.cardarea == G.jokers then
      card.ability.extra.xmult = 1
      return {
        message = localize('k_reset')
      }
    end
  end
}
