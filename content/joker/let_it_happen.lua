SMODS.Joker {
  key = "let_it_happen",
  config = {
    extra = {
      hands_played_this_ante = {},
    }
  },
  pools = {
    Music = true
  },
  rarity = 3,
  pos = { x = 7, y = 2 },
  atlas = "jokers_atlas",
  cost = 8,
  unlocked = false,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,
  soul_pos = nil,

  locked_loc_vars = function(self, info_queue, card)
    local other_name = localize('k_unknown')
    if G.P_CENTERS['b_plasma'].unlocked then
      other_name = localize { type = 'name_text', set = 'Back', key = 'b_plasma' }
    end

    return {
      vars = {
        other_name,
        localize { type = 'name_text', set = 'Stake', key = 'stake_gold' },
        colours = { get_stake_col(8) }
      }
    }
  end,

  check_for_unlock = function(self, args)
    if args.type == 'win_deck' and (get_deck_win_stake('b_plasma') > 1) then
      G.GAME.paperback.let_it_happen_unlock_check = true
    end
    return G.GAME.paperback.let_it_happen_unlock_check and args.type == 'win_stake' and get_deck_win_stake() >= 8
  end,

  loc_vars = function(self, info_queue, card)
    local hands_played_string = ""

    for i = 1, #card.ability.extra.hands_played_this_ante do
      if i == 1 then
        hands_played_string = hands_played_string .. " "
      else
        hands_played_string = hands_played_string .. ", "
      end

      hands_played_string = hands_played_string .. localize(card.ability.extra.hands_played_this_ante[i], "poker_hands")
    end

    if hands_played_string == "" then
      hands_played_string = " " .. localize('paperback_none')
    end

    return {
      vars = {
        hands_played_string
      }
    }
  end,

  calculate = function(self, card, context)
    if context.joker_main then
      -- Return early if hand has already been played this ante
      for i = 1, #card.ability.extra.hands_played_this_ante do
        if context.scoring_name == card.ability.extra.hands_played_this_ante[i] then
          return
        end
      end

      -- Balance the chips if the hand is not debuffed
      if not context.debuffed_hand then
        return {
          func = function()
            PB_UTIL.apply_plasma_effect(context.blueprint_card or card)
            table.insert(card.ability.extra.hands_played_this_ante, context.scoring_name)
            table.sort(card.ability.extra.hands_played_this_ante,
              function(a, b)
                return SMODS.PokerHands[a].order > SMODS.PokerHands[b].order
              end
            )
          end
        }
      end
    end

    -- Reset the joker at the end of the ante
    ---@diagnostic disable-next-line: undefined-field
    if context.end_of_round and context.main_eval and G.GAME.blind.boss and not context.blueprint then
      card.ability.extra.hands_played_this_ante = {}

      return {
        message = localize('k_reset'),
        colour = { 0.8, 0.45, 0.85, 1 }
      }
    end
  end,

  joker_display_def = function(JokerDisplay)
    return {
      text = {
        { ref_table = "card.joker_display_values", ref_value = "text" },
      },
      text_config = { colour = G.C.PURPLE },
      calc_function = function(card)
        local scoring_name, _, _ = JokerDisplay.evaluate_hand()
        card.joker_display_values.will_trigger = true
        -- No trigger if hand has been played this ante
        for i = 1, #card.ability.extra.hands_played_this_ante do
          if scoring_name == card.ability.extra.hands_played_this_ante[i] then
            card.joker_display_values.will_trigger = false
            break
          end
        end
        card.joker_display_values.text = card.joker_display_values.will_trigger and "Balance" or "-"
      end,
      style_function = function(card, text, reminder_text, extra)
        if text and text.children[1] then
          text.children[1].config.colour = card.joker_display_values.will_trigger and G.C.PURPLE or
              G.C.UI.TEXT_INACTIVE
        end
        return false
      end
    }
  end,
}
