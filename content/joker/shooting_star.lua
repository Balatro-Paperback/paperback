SMODS.Joker {
  key = "shooting_star",
  config = {
    extra = {
      odds = 4,
      suit = 'paperback_Stars'
    }
  },
  rarity = 2,
  pos = { x = 14, y = 1 },
  atlas = "jokers_atlas",
  cost = 6,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,
  paperback = {
    requires_stars = true
  },

  loc_vars = function(self, info_queue, card)
    local numerator, denominator = PB_UTIL.chance_vars(card)

    return {
      vars = {
        localize(card.ability.extra.suit, 'suits_plural'),
        numerator,
        denominator,
        colours = {
          G.C.SUITS[card.ability.extra.suit] or G.C.PAPERBACK_STARS_LC
        }
      }
    }
  end,

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play and context.other_card:is_suit(card.ability.extra.suit) then
      if PB_UTIL.chance(card, 'shooting_star') then
        local planet = PB_UTIL.get_planet_for_hand(context.scoring_name)

        if planet and PB_UTIL.can_spawn_card(G.consumeables, true) then
          return {
            message = localize('k_plus_planet'),
            colour = G.C.SECONDARY_SET.Planet,
            func = function()
              G.E_MANAGER:add_event(Event {
                func = function()
                  SMODS.add_card { key = planet }
                  G.GAME.consumeable_buffer = 0
                  return true
                end
              })
            end
          }
        end
      end
    end
  end
}
