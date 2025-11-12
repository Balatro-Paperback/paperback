SMODS.Joker { -- Guns Blazin'
  key = "guns_blazin",
  config = {
    extra = {
      xmult = 1.5,
    }
  },
  pos = {
    x = 15,
    y = 4
  },
  cost = 8,
  rarity = 2,
  blueprint_compat = true,
  eternal_compat = true,
  unlocked = false,
  discovered = false,
  atlas = 'jokers_atlas',
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.xmult } }
  end,
  locked_loc_vars = function(self, info_queue, card)
    return { vars = { 5 } }
  end,

  check_for_unlock = function(self, args)
    if args.type == 'hand_contents' then
    local tally = 0
      for j = 1, #args.cards do
        if SMODS.has_enhancement(args.cards[j], 'm_steel') then
          tally = tally + 1
          if tally >= 5 then
            return true
          end
        end
      end
    end
    return false
  end,

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      if context.other_card:get_id() == 14 then
        return {
          x_mult = card.ability.extra.xmult
        }
      end
    end
  end,

  -- Taken from JokerDisplay's Triboulet
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
        local count = 0
        local text, _, scoring_hand = JokerDisplay.evaluate_hand()
        if text ~= 'Unknown' then
          for _, scoring_card in pairs(scoring_hand) do
            if scoring_card:get_id() == 14 then
              count = count +
                  JokerDisplay.calculate_card_triggers(scoring_card, scoring_hand)
            end
          end
        end
        card.joker_display_values.x_mult = card.ability.extra.xmult ^ count
        card.joker_display_values.localized_text = localize("Ace", "ranks")
      end
    }
  end,

}
