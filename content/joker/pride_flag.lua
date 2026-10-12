if PB_UTIL.config.suits_enabled then
  SMODS.Joker {
    key = 'pride_flag',
    config = {
      extra = {
        a_chips = 12,
        chips = 0,
      }
    },
    attributes = {
      'chips',
      'scaling',
      'hand_type',
      'reset'
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

    paperback_credit = {
      coder = { 'oppositewolf' }
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
      return PB_UTIL.spectrum_played()
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
          SMODS.reset_card(card, {
            ref_table = card.ability.extra,
            ref_value = 'chips',
            reset_value = 0,
            message_colour = G.C.RED
          })
          return nil, true
          -- Give chips if hand contains a Spectrum
        elseif PB_UTIL.get_unique_suits(context.full_hand, nil, true) >= 5 then
          SMODS.scale_card(card, {
            ref_table = card.ability.extra,
            ref_value = 'chips',
            scalar_value = 'a_chips',
            message_colour = G.C.CHIPS
          })
          return nil, true
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
        a_chips = 30
      }
    },
    attributes = {
      'mult',
      'scaling',
      'suit'
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

    paperback_credit = {
      coder = { 'oppositewolf' }
    },
    loc_vars = function(self, info_queue, card)
      return {
        vars = {
          card.ability.extra.a_chips
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
      if context.joker_main then
        return {
          chips = card.ability.extra.a_chips * PB_UTIL.get_unique_suits(context.scoring_hand)
        }
      end
    end,
  }
end
