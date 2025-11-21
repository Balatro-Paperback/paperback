if PB_UTIL.should_load_spectrum_items() then
  SMODS.Joker {
    key = "the_dynasty",
    config = {
      Xmult = 5,
      type = 'paperback_Spectrum'
    },
    rarity = 3,
    pos = { x = 19, y = 2 },
    atlas = "jokers_atlas",
    cost = 8,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    paperback = {
      requires_custom_suits = true,
      requires_spectrum_or_suit = true
    },

    loc_vars = function(self, info_queue, card)
      return {
        vars = {
          card.ability.Xmult,
          localize(card.ability.type, 'poker_hands')
        }
      }
    end,

    -- Copied from JokerDisplay
    joker_display_def = function(JokerDisplay)
      return {
        text = {
          {
            border_nodes = {
              { text = "X" },
              { ref_table = "card.joker_display_values", ref_value = "x_mult", retrigger_type = "exp" }
            }
          }
        },
        reminder_text = {
          { text = "(" },
          { ref_table = "card.joker_display_values", ref_value = "localized_text", colour = G.C.ORANGE },
          { text = ")" },
        },
        calc_function = function(card)
          local x_mult = 1
          local _, poker_hands, _ = JokerDisplay.evaluate_hand()
          if poker_hands[card.ability.type] and next(poker_hands[card.ability.type]) then
            x_mult = card.ability.Xmult
          end
          card.joker_display_values.x_mult = x_mult
          card.joker_display_values.localized_text = localize(card.ability.type, 'poker_hands')
        end
      }
    end,
  }
end
