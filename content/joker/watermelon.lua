SMODS.Joker {
  key = "watermelon",
  config = {
    extra = {
      a_xmult = 0.1,
      x_mult = 1,
    }
  },
  rarity = 2,
  pos = { x = 12, y = 10 },
  atlas = "jokers_atlas",
  cost = 6,
  unlocked = true,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = false,
  perishable_compat = false,
  soul_pos = nil,
  pools = {
    Food = true
  },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.a_xmult,
        card.ability.extra.x_mult,
      }
    }
  end,

  calculate = function(self, card, context)
    if not context.blueprint and context.setting_ability and context.other_card.ability.set == 'Enhanced' and not context.unchanged then
      card.ability.extra.x_mult = card.ability.extra.x_mult + card.ability.extra.a_xmult
      return {
        message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.a_xmult } },
        colour = G.C.MULT
      }
    end
    if not context.blueprint and context.remove_playing_cards and #context.removed > 0 then
      card.ability.extra.x_mult = card.ability.extra.x_mult - (card.ability.extra.a_xmult * #context.removed)
      if card.ability.extra.x_mult < 1 then
        PB_UTIL.destroy_joker(card)
        return {
          message = localize('k_eaten_ex'),
          colour = G.C.FILTER
        }
      else
        return {
          message = localize {
            type = 'variable',
            key = 'a_xmult_minus',
            vars = { card.ability.extra.a_xmult * #context.removed }
          },
          colour = G.C.MULT
        }
      end
    end
    if context.cardarea == G.jokers and context.joker_main then
      return { xmult = card.ability.extra.x_mult }
    end
  end
}
