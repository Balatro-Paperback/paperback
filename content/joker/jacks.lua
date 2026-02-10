SMODS.Joker {
  key = "jacks",
  config = {
    extra = {
      mult = 0,
      change = 1,
      rank = "Jack"
    }
  },
  rarity = 1,
  pos = { x = 24, y = 8 },
  atlas = "jokers_atlas",
  cost = 5,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = false,
  paperback_credit = {
    coder = { 'thermo' }
  },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.change,
        card.ability.extra.mult,
        card.ability.extra.rank
      }
    }
  end,

  calculate = function(self, card, context)
    if context.joker_main and card.ability.extra.mult > 0 then
      return {
        mult = card.ability.extra.mult
      }
    end
    if context.discard and PB_UTIL.is_rank(context.other_card, card.ability.extra.rank) then
      card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.change
      return {
        message = localize('k_upgrade_ex'),
        colour = G.C.ORANGE
      }
    end
  end
}
