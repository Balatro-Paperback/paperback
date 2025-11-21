SMODS.Joker {
  key = 'quartz',
  config = {
    extra = {
      x_chips = 0.2
    }
  },
  rarity = 2,
  pos = { x = 1, y = 9 },
  atlas = 'jokers_atlas',
  cost = 7,
  unlocked = true,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,
  paperback = {
    requires_stars = true
  },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.x_chips
      }
    }
  end,

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      if context.other_card:is_suit('paperback_Stars') then
        local stars = 0

        for _, v in ipairs(context.full_hand) do
          if v:is_suit('paperback_Stars') and v ~= context.other_card then
            stars = stars + 1
          end
        end

        if stars > 0 then
          return {
            x_chips = 1 + card.ability.extra.x_chips * stars
          }
        end
      end
    end
  end,

  joker_display_def = function(JokerDisplay)
    return {
      text = {
        {
          border_nodes = {
            { text = "X" },
            { ref_table = "card.joker_display_values", ref_value = "x_chips", retrigger_type = "exp" }
          },
          border_colour = G.C.CHIPS
        }
      },
      reminder_text = {
        { text = "(" },
        {
          ref_table = "card.joker_display_values",
          ref_value = "localized_text",
          colour = lighten(loc_colour('paperback_stars'), 0.35)
        },
        { text = ")" },
      },
      calc_function = function(card)
        local count, stars = 0, 0
        for _, v in ipairs(G.hand.highlighted) do
          if v:is_suit('paperback_Stars') then
            stars = stars + 1
          end
        end
        for _, v in ipairs(G.play.cards) do
          if v:is_suit('paperback_Stars') then
            stars = stars + 1
          end
        end
        if stars <= 1 then
          card.joker_display_values.x_chips = 1; return
        end

        -- Count star triggers
        local _, _, scoring_hand = JokerDisplay.evaluate_hand()
        for _, scoring_card in pairs(scoring_hand) do
          if scoring_card:is_suit('paperback_Stars') then
            count = count +
                JokerDisplay.calculate_card_triggers(scoring_card, scoring_hand)
          end
        end
        card.joker_display_values.x_chips = (1 + card.ability.extra.x_chips * (stars - 1)) ^ count
        card.joker_display_values.localized_text = localize('paperback_Stars', 'suits_plural')
      end
    }
  end,
}
