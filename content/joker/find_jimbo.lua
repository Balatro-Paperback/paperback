SMODS.Joker {
  key = "find_jimbo",
  config = {
    extra = {
      money = 5,
      rank = 'Ace',
      suit = 'Spades'
    }
  },
  rarity = 1,
  pos = { x = 1, y = 7 },
  atlas = "jokers_atlas",
  cost = 4,
  unlocked = false,
  blueprint_compat = true,
  eternal_compat = true,

  check_for_unlock = function(self, args)
    if args.type == 'hand' and args.handname == 'High Card' then
      for _, c in pairs(args.scoring_hand) do
        if PB_UTIL.is_rank(c, 'Jack') then
          G.GAME.paperback.find_jimbo_unlock = true
          break
        end
      end
    end

    return args.type == 'round_win' and G.GAME.paperback.find_jimbo_unlock
  end,

  locked_loc_vars = function(self, info_queue, card)
    return {
      vars = {
        localize('High Card', 'poker_hands'),
        localize('Jack', 'ranks')
      }
    }
  end,
  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        localize(card.ability.extra.rank, 'ranks'),
        localize(card.ability.extra.suit, 'suits_plural'),
        card.ability.extra.money,
        colours = {
          G.C.SUITS[card.ability.extra.suit]
        }
      }
    }
  end,

  set_ability = function(self, card, initial, delay_sprites)
    if G.STAGE == G.STAGES.RUN then
      PB_UTIL.reset_find_jimbo(card)
    end
  end,

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      local c = context.other_card

      if c and c:is_suit(card.ability.extra.suit) and PB_UTIL.is_rank(c, card.ability.extra.rank) then
        return {
          dollars = card.ability.extra.money,
          message_card = c,
          juice_card = context.blueprint_card or card
        }
      end
    end

    if not context.blueprint and context.end_of_round and context.main_eval then
      PB_UTIL.reset_find_jimbo(card)
    end
  end,

  -- Adapted from JokerDisplay's Idol
  joker_display_def = function(JokerDisplay)
    return {
      text = {
        { text = "+$" },
        { ref_table = "card.joker_display_values", ref_value = "dollars" },
      },
      text_config = { colour = G.C.GOLD },
      reminder_text = {
        { text = "(" },
        { ref_table = "card.joker_display_values", ref_value = "find_jimbo_card" },
        { text = ")" },
      },
      calc_function = function(card)
        local count = 0
        local text, _, scoring_hand = JokerDisplay.evaluate_hand()
        for _, c in pairs(scoring_hand) do
          if c:is_suit(card.ability.extra.suit) and PB_UTIL.is_rank(c, card.ability.extra.rank) then
            count = count + JokerDisplay.calculate_card_triggers(c, scoring_hand)
          end
        end
        card.joker_display_values.dollars = card.ability.extra.money * count
        card.joker_display_values.find_jimbo_card = localize {
          type = 'variable', key = "jdis_rank_of_suit",
          vars = { localize(card.ability.extra.rank, 'ranks'), localize(card.ability.extra.suit, 'suits_plural'), } }
      end,
      style_function = function(card, text, reminder_text, extra)
        if reminder_text and reminder_text.children[2] then
          reminder_text.children[2].config.colour = lighten(G.C.SUITS[card.ability.extra.suit], 0.35)
        end
        return false
      end
    }
  end,
}

function PB_UTIL.reset_find_jimbo(card)
  local valid_cards = {}

  for k, v in ipairs(G.playing_cards) do
    if not SMODS.has_no_suit(v) and not SMODS.has_no_rank(v) then
      valid_cards[#valid_cards + 1] = v
    end
  end

  if #valid_cards > 0 then
    local selected_card = pseudorandom_element(valid_cards, pseudoseed('find_jimbo'))
    card.ability.extra.rank = selected_card.base.value
    card.ability.extra.suit = selected_card.base.suit
  end
end
