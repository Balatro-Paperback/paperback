if PB_UTIL.should_load_spectrum_items() then
  SMODS.Joker {
    key = "lurid_joker",
    config = {
      t_chips = 80,
      type = 'paperback_Spectrum'
    },
    rarity = 1,
    pos = { x = 19, y = 1 },
    atlas = "jokers_atlas",
    cost = 3,
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
          card.ability.t_chips,
          localize(card.ability.type, 'poker_hands')
        }
      }
    end,

    -- Copied from JokerDisplay
    joker_display_def = function(JokerDisplay)
      return {
        text = {
          { text = "+" },
          { ref_table = "card.joker_display_values", ref_value = "chips", retrigger_type = "mult" }
        },
        text_config = { colour = G.C.CHIPS },
        reminder_text = {
          { text = "(" },
          { ref_table = "card.joker_display_values", ref_value = "localized_text", colour = G.C.ORANGE },
          { text = ")" },
        },
        calc_function = function(card)
          local chips = 0
          local _, poker_hands, _ = JokerDisplay.evaluate_hand()
          if poker_hands[card.ability.type] and next(poker_hands[card.ability.type]) then
            chips = card.ability.t_chips
          end
          card.joker_display_values.chips = chips
          card.joker_display_values.localized_text = localize(card.ability.type, 'poker_hands')
        end
      }
    end,
  }
end
