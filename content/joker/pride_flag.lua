if PB_UTIL.config.suits_enabled then
  SMODS.Joker {
    key = 'pride_flag',
    config = {
      extra = {
        a_chips = 12,
        chips = 0,
      }
    },
    rarity = 1,
    pos = { x = 3, y = 0 },
    atlas = 'jokers_atlas',
    cost = 6,
    unlocked = false,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    paperback = {
      requires_spectrum_or_suit = true
    },

    loc_vars = function(self, info_queue, card)
      return {
        vars = {
          card.ability.extra.a_chips,
          card.ability.extra.chips
        },
        key = "j_paperback_pride_flag_spectrums"
      }
    end,

    check_for_unlock = function(self, args)
      if args.type == 'hand_contents' then
        local eval = evaluate_poker_hand(args.cards)
        if next(eval['paperback_Spectrum']) then
          return true
        end
      end
      return false
    end,
    locked_loc_vars = function(self, info_queue, card)
      return { key = "j_paperback_pride_flag_spectrums" }
    end,

    -- Calculate function for the Joker
    calculate = function(self, card, context)
      -- Check if the card is being calculated before the scoring hand is scored and not blueprinted
      if context.before and not context.blueprint then
        -- Reset if played hand contains a 'Straight'
        if next(context.poker_hands['Straight']) then
          card.ability.extra.chips = 0

          SMODS.calculate_effect {
            message = localize('k_reset'),
            colour = G.C.RED,
            card = card,
          }
          -- Give chips if hand contains a Spectrum
        elseif PB_UTIL.get_unique_suits(context.full_hand, nil, true) >= 5 then
          card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.a_chips

          SMODS.calculate_effect {
            message = localize('k_upgrade_ex'),
            colour = G.C.CHIPS,
            card = card
          }
        end
      end

      -- Gives the chips during scoring
      if context.joker_main then
        return {
          chips = card.ability.extra.chips
        }
      end
    end,

    joker_display_def = function(JokerDisplay)
      return {
        text = {
          { text = "+" },
          { ref_table = "card.ability.extra", ref_value = "chips", retrigger_type = "mult" }
        },
        text_config = { colour = G.C.CHIPS },
      }
    end,
  }
else
  SMODS.Joker {
    key = 'pride_flag',
    config = {
      extra = {
        a_mult = 2,
        mult = 0
      }
    },
    rarity = 1,
    pos = { x = 3, y = 0 },
    atlas = 'jokers_atlas',
    cost = 6,
    unlocked = false,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    soul_pos = nil,

    loc_vars = function(self, info_queue, card)
      return {
        vars = {
          card.ability.extra.a_mult,
          card.ability.extra.mult
        },
        key = "j_paperback_pride_flag_no_spectrums"
      }
    end,

    locked_loc_vars = function(self, info_queue, card)
      return {
        vars = {
          4
        },
        key = "j_paperback_pride_flag_no_spectrums"
      }
    end,

    check_for_unlock = function(self, args)
      if args.type == 'hand' then
        local new_cards = {}
        local wild_check = false

        for _, card in ipairs(args.scoring_hand) do
          if SMODS.has_any_suit(card) and not wild_check then
            wild_check = true
          else
            table.insert(new_cards, card)
          end
        end
        return wild_check and PB_UTIL.get_unique_suits(new_cards, nil, true) >= 4
      end
    end,

    -- Calculate function for the Joker
    calculate = function(self, card, context)
      -- Check if the card is being calculated before the scoring hand is scored and not blueprinted
      if context.before and not context.blueprint then
        -- Get the number of unique suits in the scoring hand
        local unique_suits = PB_UTIL.get_unique_suits(context.scoring_hand)

        -- If there are 3 unique suits, upgrade the joker
        if unique_suits >= 3 then
          card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.a_mult

          return {
            message = localize('k_upgrade_ex'),
            colour = G.C.MULT,
            card = card
          }
        end
      end

      -- Gives the mult during scoring
      if context.joker_main then
        return {
          mult = card.ability.extra.mult
        }
      end
    end,

    joker_display_def = function(JokerDisplay)
      return {
        text = {
          { text = "+" },
          { ref_table = "card.ability.extra", ref_value = "mult", retrigger_type = "mult" }
        },
        text_config = { colour = G.C.MULT },
      }
    end,
  }
end
