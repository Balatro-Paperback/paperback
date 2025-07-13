SMODS.Joker {
  key = "blue_marble",
  config = {
    extra = {
      suit = 'Clubs',
      odds = 3,
    }
  },
  rarity = 1,
  pos = { x = 11, y = 1 },
  atlas = "jokers_atlas",
  cost = 3,
  unlocked = true,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,

  loc_vars = function(self, info_queue, card)
    local numerator, denominator = PB_UTIL.chance_vars(card)

    return {
      vars = {
        numerator,
        denominator,
        localize(card.ability.extra.suit, 'suits_singular'),
        colours = {
          G.C.SUITS[card.ability.extra.suit]
        }
      }
    }
  end,

  calculate = function(self, card, context)
    if context.before then
      -- Check scoring hand for any club
      for _, v in ipairs(context.scoring_hand) do
        if v:is_suit(card.ability.extra.suit) then
          -- Planet spawn
          if PB_UTIL.chance(card, 'blue_marble_planet') then
            if PB_UTIL.try_spawn_card { set = 'Planet' } then
              return {
                message = localize('k_plus_planet'),
                colour = G.C.SECONDARY_SET.Planet
              }
            end
            break
          end
        end
      end
    end
  end,

  joker_display_def = function(JokerDisplay)
    return {
      reminder_text = {
        { text = '(' },
        { ref_table = 'card.joker_display_values', ref_value = 'localized_suit' },
        { text = ')' }
      },

      calc_function = function(card)
        card.joker_display_values.localized_suit = localize(card.ability.extra.suit, 'suits_singular')
      end,

      style_function = function(card, text, reminder_text, extra)
        if reminder_text and reminder_text.children[2] then
          reminder_text.children[2].config.colour = G.C.SUITS[card.ability.extra.suit]
        end
      end,
    }
  end
}
