SMODS.Joker {
  key = "silent_assassin",
  config = {
    extra = {
      ranks = { "4", "7" },
      mult = 1,
      change = 1,
      destroy_req = 2,
      destroyed = 0,
    }
  },
  rarity = 1,
  pos = { x = 14, y = 11 },
  atlas = "jokers_atlas",
  cost = 8,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = false,
  paperback_credit = {
    coder = { 'thermo' }
  },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.ranks[1],
        card.ability.extra.ranks[2],
        card.ability.extra.mult,
        card.ability.extra.change,
        card.ability.extra.destroy_req,
        card.ability.extra.destroy_req - card.ability.extra.destroyed
      }
    }
  end,

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      if PB_UTIL.is_rank(context.other_card, card.ability.extra.ranks[1]) or PB_UTIL.is_rank(context.other_card, card.ability.extra.ranks[2]) then
        return {
          mult = card.ability.extra.mult
        }
      end
    end
    if context.remove_playing_cards and not context.blueprint then
      local destroyed = card.ability.extra.destroyed + #context.removed
      card.ability.extra.destroyed = destroyed % card.ability.extra.destroy_req
      local change = math.floor(destroyed / card.ability.extra.destroy_req) * card.ability.extra.change
      card.ability.extra.mult = card.ability.extra.mult + change
      if change > 0 then
        return {
          message = localize('k_upgrade_ex')
        }
      end
    end
  end
}
