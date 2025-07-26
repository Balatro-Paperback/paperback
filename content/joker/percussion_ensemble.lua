SMODS.Joker {
  key = "percussion_ensemble",
  config = {
    extra = {
      xMult = 1,
      xMult_mod = .25
    }
  },
  rarity = 2,
  pos = { x = 16, y = 5 },
  atlas = "jokers_atlas",
  cost = 7,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,

  loc_vars = function(self, info_queue, card)
    local unique_specials = PB_UTIL.special_cards_in_deck(true, false) or 0

    return {
      vars = {
        card.ability.extra.xMult_mod,
        card.ability.extra.xMult_mod * unique_specials + card.ability.extra.xMult
      }
    }
  end,

  calculate = function(self, card, context)
    if context.joker_main then
      if PB_UTIL.special_cards_in_deck(true, false) >= 1 then
        return {
          x_mult = card.ability.extra.xMult + card.ability.extra.xMult_mod * PB_UTIL.special_cards_in_deck(true, false)
        }
      end
    end
  end
}
