SMODS.Joker {
  key = "book_of_vengeance",
  rarity = 3,
  pos = { x = 4, y = 9 },
  atlas = 'jokers_atlas',
  cost = 9,
  unlocked = true,
  discovered = false,
  blueprint_compat = false,
  eternal_compat = false,
  perishable_compat = true,

  loc_vars = function(self, info_queue, card)
    local main_end

    if G.jokers then
      for _, v in ipairs(G.jokers.cards) do
        if v.edition and v.edition.negative then
          main_end = {}
          localize {
            type = 'other',
            key = 'remove_negative',
            nodes = main_end
          }
          break
        end
      end
    end

    return {
      main_end = main_end and main_end[1]
    }
  end,

  calculate = function(self, card, context)
    if context.first_hand_drawn and G.GAME.blind.boss then
      local eval = function() return G.GAME.current_round.hands_played == 0 end
      juice_card_until(card, eval, true)
    end

    if not context.blueprint and context.end_of_round and context.main_eval
        and G.GAME.blind.boss and G.GAME.current_round.hands_played <= 1 then
      local other_joker

      for i, v in ipairs(G.jokers.cards) do
        if v == card then
          other_joker = G.jokers.cards[i + 1]
          break
        end
      end

      if other_joker and other_joker ~= card then
        PB_UTIL.destroy_joker(card, function()
          if #G.jokers.cards <= G.jokers.config.card_limit then
            local strip_edition = other_joker.edition and other_joker.edition.negative
            local copy = copy_card(other_joker, nil, nil, nil, strip_edition)
            copy:add_to_deck()
            G.jokers:emplace(copy)
          end
        end)

        return {
          message = localize('k_duplicated_ex')
        }
      end
    end
  end,

  joker_display_def = function(JokerDisplay)
    return {
      reminder_text = {
        { ref_table = 'card.joker_display_values', ref_value = 'active', scale = 0.35 },
      },

      calc_function = function(card)
        card.joker_display_values.active = (G.GAME.blind.boss and G.GAME.current_round.hands_played == 0) and
            localize('k_active') or localize('paperback_inactive')
      end,

      style_function = function(card, text, reminder_text, extra)
        if reminder_text and reminder_text.children[1] then
          reminder_text.children[1].config.colour = card.joker_display_values.active == localize('k_active') and
              G.C.GREEN or G.C.UI.TEXT_INACTIVE
        end
      end
    }
  end
}
