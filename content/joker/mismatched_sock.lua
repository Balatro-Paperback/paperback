SMODS.Joker {
  key = 'mismatched_sock',
  config = {
    extra = {
      x_mult = 1,
      a_xmult = 0.1,
    }
  },
  rarity = 2,
  pos = { x = 6, y = 1 },
  atlas = 'jokers_atlas',
  cost = 6,
  unlocked = true,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = false,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.a_xmult,
        card.ability.extra.x_mult
      }
    }
  end,

  calculate = function(self, card, context)
    -- Upgrade x mult if discard contains only one card
    if not context.blueprint and context.discard then
      if #context.full_hand == 1 then
        card.ability.extra.x_mult = card.ability.extra.x_mult + card.ability.extra.a_xmult
        return {
          message = localize('k_upgrade_ex'),
          colour = G.C.ORANGE
        }
      end
    end

    -- Give mult during scoring
    if context.joker_main then
      return {
        x_mult = card.ability.extra.x_mult
      }
    end
  end
}
