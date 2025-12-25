SMODS.Joker {
  key = "planchette",
  config = {
    extra = {
      xmult = 1,
      xmult_gain = 0.25,
    },
  },
  rarity = 2,
  pos = { x = 25, y = 10 },
  atlas = "jokers_atlas",
  cost = 6,
  unlocked = true,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = false,
  soul_pos = nil,

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.xmult_gain, card.ability.extra.xmult } }
  end,

  calculate = function(self, card, context)
    if not context.blueprint and context.using_consumeable and context.consumeable.ability.set == 'Spectral' then
      card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmult_gain
      return {
        message = localize('k_upgrade_ex'),
        colour = G.C.MULT,
      }
    end
    if context.joker_main then
      return { xmult = card.ability.extra.xmult }
    end
  end
}
