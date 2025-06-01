SMODS.Joker {
  key = 'mismatched_sock',
  config = {
    extra = {
      x_mult = 1,
      a_xmult = 0.1,
      hand = 'Pair'
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
        localize(card.ability.extra.hand, 'poker_hands'),
        card.ability.extra.x_mult
      }
    }
  end,

  calculate = function(self, card, context)
    -- Upgrade x mult if no pairs were played
    if not context.blueprint and context.before and context.main_eval then
      if not next(context.poker_hands[card.ability.extra.hand]) then
        card.ability.extra.x_mult = card.ability.extra.x_mult + card.ability.extra.a_xmult

        return {
          message = localize('k_upgrade_ex'),
          colour = G.C.MULT
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
