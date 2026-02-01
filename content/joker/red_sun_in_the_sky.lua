SMODS.Joker {
  key = "red_sun_in_the_sky",
  config = {
    extra = {
      mult = 0,
      change = 1
    }
  },
  rarity = 1,
  pos = { x = 19, y = 5 },
  atlas = "jokers_atlas",
  cost = 5,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,
  paperback = {
    coder = { 'thermo' }
  },

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = PB_UTIL.suit_tooltip('light')
    return {
      vars = {
        card.ability.extra.change,
        card.ability.extra.mult
      }
    }
  end,

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      if PB_UTIL.is_suit(context.other_card, 'light') then
        if not context.blueprint then card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.change end
        return {
          mult = card.ability.extra.mult
        }
      end
    end
    if context.end_of_round and context.main_eval then
      card.ability.extra.mult = 0
      return {
        message = localize('k_reset'),
        colour = G.C.ORANGE
      }
    end
  end
}
