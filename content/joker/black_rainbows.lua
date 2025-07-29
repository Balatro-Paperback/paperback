SMODS.Joker {
  key = 'black_rainbows',
  config = {
    extra = {
      odds = 11,
      suit1 = 'Spades',
      suit2 = 'Clubs'
    }
  },
  pools = {
    Music = true
  },
  rarity = 2,
  pos = { x = 7, y = 3 },
  atlas = 'jokers_atlas',
  cost = 8,
  unlocked = true,
  discovered = false,
  blueprint_compat = false,
  eternal_compat = true,
  soul_pos = nil,

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.e_polychrome
    local numerator, denominator = PB_UTIL.chance_vars(card)

    return {
      vars = {
        numerator,
        denominator
      }
    }
  end,

  calculate = function(self, card, context)
    local ctx = context.paperback

    if not context.blueprint and ctx and ctx.modify_final_hand then
      local polychrome_triggered = false

      -- Go through each card in the scoring hand and check if it is a valid card
      for k, v in pairs(ctx.scoring_hand) do
        if (v:is_suit(card.ability.extra.suit1) or v:is_suit(card.ability.extra.suit2)) and not v.debuff and not v.edition then
          -- If the odds succeed, set the card's edition to polychrome
          if PB_UTIL.chance(card, "black_rainbows") then
            polychrome_triggered = true
            v:set_edition('e_polychrome')
          end
        end
      end

      -- Display a message if a card was turned polychrome
      if polychrome_triggered then
        return {
          message = localize('paperback_polychrome_ex'),
          colour = G.C.GREEN,
          card = card
        }
      end
    end
  end,

  joker_display_def = function(JokerDisplay)
    return {
      reminder_text = {
        { text = '(' },
        { ref_table = 'card.joker_display_values', ref_value = 'localized_suit1' },
        { text = ', ' },
        { ref_table = 'card.joker_display_values', ref_value = 'localized_suit2' },
        { text = ')' }
      },

      extra = {
        {
          { text = '(' },
          { ref_table = 'card.joker_display_values', ref_value = 'odds' },
          { text = ')' }
        }
      },
      extra_config = {
        colour = G.C.GREEN,
        scale = 0.3
      },

      calc_function = function(card)
        card.joker_display_values.odds = localize { type = 'variable', key = 'jdis_odds', vars = { PB_UTIL.chance_vars(card) } }
        card.joker_display_values.localized_suit1 = localize(card.ability.extra.suit1, 'suits_plural')
        card.joker_display_values.localized_suit2 = localize(card.ability.extra.suit2, 'suits_plural')
      end,

      style_function = function(card, text, reminder_text, extra)
        if reminder_text and reminder_text.children[2] and reminder_text.children[4] then
          reminder_text.children[2].config.colour = G.C.SUITS[card.ability.extra.suit1]
          reminder_text.children[4].config.colour = G.C.SUITS[card.ability.extra.suit2]
        end
      end,
    }
  end
}
