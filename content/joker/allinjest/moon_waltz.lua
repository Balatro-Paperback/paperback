SMODS.Joker {
  key = "moon_waltz",
  config = {
    extra = {
      chips = 0,
      mult = 0,
      odds = 2
    }
  },
  pools = {
    Music = true
  },
  rarity = 2,
  pos = { x = 15, y = 8 },
  atlas = 'jokers_atlas',
  cost = 5,
  unlocked = true,
  discovered = false,
  blueprint_compat = false,
  eternal_compat = false,
  perishable_compat = true,

  loc_vars = function(self, info_queue, card)
    local numerator, denominator = PB_UTIL.chance_vars(card)
    return {
      vars = {
        card.ability.extra.mult,
        card.ability.extra.chips,
        numerator,
        denominator,
      }
    }
  end,

  calculate = function(self, card, context)
    if context.using_consumeable then
      if context.consumeable and context.consumeable.ability.moon and context.consumeable.ability.hand_type then
        if PB_UTIL.chance(card, 'moon_waltz') then
          if context.consumeable.ability.chips then
            card.ability.extra.chips = card.ability.extra.chips +
                (G.GAME.hands[context.consumeable.ability.hand_type].l_chips)
            return {
              message = localize {
                type = 'variable',
                key = 'a_chips',
                vars = { card.ability.extra.chips }
              },
              colour = G.C.CHIPS
            }
          else
            if context.consumeable.ability.mult then
              card.ability.extra.mult = card.ability.extra.mult +
                  (G.GAME.hands[context.consumeable.ability.hand_type].l_mult)
              return {
                message = localize {
                  type = 'variable',
                  key = 'a_mult',
                  vars = { card.ability.extra.mult }
                },
                colour = G.C.MULT
              }
            end
          end
        end
      end
    end

    if context.joker_main then
      return {
        mult = card.ability.extra.mult,
        chips = card.ability.extra.chips
      }
    end
  end,
}
