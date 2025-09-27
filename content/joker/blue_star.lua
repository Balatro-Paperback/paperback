SMODS.Joker {
  key = "blue_star",
  config = {
    extra = {
      x_chips = 1,
      good = {
        suit = 'paperback_Stars',
        a_xchips = 0.05
      },
      bad = {
        suit = 'Clubs',
        a_xchips = 0.2
      }
    }
  },
  rarity = 3,
  pos = { x = 11, y = 5 },
  atlas = "jokers_atlas",
  cost = 8,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = false,
  paperback = {
    requires_stars = true
  },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.good.a_xchips,
        localize(card.ability.extra.good.suit, 'suits_singular'),
        card.ability.extra.bad.a_xchips,
        localize(card.ability.extra.bad.suit, 'suits_singular'),
        card.ability.extra.x_chips,
        colours = {
          G.C.SUITS[card.ability.extra.good.suit] or G.C.PAPERBACK_STARS_LC,
          G.C.SUITS[card.ability.extra.bad.suit]
        }
      }
    }
  end,

  calculate = function(self, card, context)
    if not context.blueprint and context.individual and context.cardarea == G.play then
      if context.other_card:is_suit(card.ability.extra.good.suit) then
        card.ability.extra.x_chips = card.ability.extra.x_chips + card.ability.extra.good.a_xchips

        return {
          message = localize {
            type = 'variable',
            key = 'a_xchips',
            vars = { card.ability.extra.x_chips }
          },
          message_card = card,
          colour = G.C.CHIPS,
        }
      elseif context.other_card:is_suit(card.ability.extra.bad.suit) then
        card.ability.extra.x_chips = math.max(0, card.ability.extra.x_chips - card.ability.extra.bad.a_xchips)

        return {
          message = localize {
            type = 'variable',
            key = 'a_xchips_minus',
            vars = { card.ability.extra.x_chips }
          },
          message_card = card,
          colour = G.C.MULT,
        }
      end
    end

    if context.joker_main then
      return {
        x_chips = card.ability.extra.x_chips
      }
    end
  end
}
