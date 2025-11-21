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
  end,

  joker_display_def = function(JokerDisplay)
    return {
      text = {
        { text = "+" },
        { ref_table = "card.joker_display_values", ref_value = "count", retrigger_type = "mult" },
      },
      text_config = { colour = G.C.SECONDARY_SET.Planet },
      reminder_text = {
        { text = "(" },
        {
          ref_table = "card.joker_display_values",
          ref_value = "localized_text",
          colour = lighten(loc_colour(G.P_CENTERS["j_paperback_shooting_star"].config.extra.suit:lower()), 0.35)
        },
        { text = ")" },
      },
      extra = {
        {
          { text = "(" },
          { ref_table = "card.joker_display_values", ref_value = "odds" },
          { text = ")" },
        }
      },
      extra_config = { colour = G.C.GREEN, scale = 0.3 },
      calc_function = function(card)
        local count = 0
        local _, _, scoring_hand = JokerDisplay.evaluate_hand()
        for _, scoring_card in pairs(scoring_hand) do
          if scoring_card:is_suit(card.ability.extra.suit) then
            count = count +
                JokerDisplay.calculate_card_triggers(scoring_card, scoring_hand)
          end
        end
        card.joker_display_values.count = count
        card.joker_display_values.odds = localize { type = 'variable', key = "jdis_odds", vars = { PB_UTIL.chance_vars(card) } }
        card.joker_display_values.localized_text =
            localize(G.P_CENTERS["j_paperback_shooting_star"].config.extra.suit, 'suits_plural')
      end
    }
  end,
}
