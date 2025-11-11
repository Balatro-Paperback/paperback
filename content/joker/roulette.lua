SMODS.Joker {
  key = "roulette",
  config = {
    extra = {
      money_for_suit = 1,
      money_for_rank = 5,
      money_for_both = 25,
    }
  },
  rarity = 2,
  pos = { x = 11, y = 10 },
  atlas = "jokers_atlas",
  cost = 7,
  unlocked = false,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,
  check_for_unlock = function(self, args)
    if args.type == 'hand_contents' then
      local eval = evaluate_poker_hand(args.cards)
      if next(eval['paperback_Spectrum Five']) then
        return true
      end
    end
    return false
  end,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.money_for_suit,
        card.ability.extra.money_for_rank,
        card.ability.extra.money_for_both,
        colours = {
          G.C.SUITS[card.ability.extra.suit]
        }
      }
    }
  end,

  calculate = function(self, card, context)
    if context.before and not context.blueprint then
      card.ability.extra.suit = pseudorandom_element(PB_UTIL.base_suits, pseudoseed('roulette_suit'))
      card.ability.extra.rank = pseudorandom_element(PB_UTIL.base_ranks, pseudoseed('roulette_rank'))
    end
    if context.individual and context.cardarea == G.play then
      local c = context.other_card
      if c then
        local suit_match = c:is_suit(card.ability.extra.suit)
        local rank_match = PB_UTIL.is_rank(c, card.ability.extra.rank)
        if suit_match and rank_match then
          return {
            dollars = card.ability.extra.money_for_both,
            message_card = c,
            juice_card = context.blueprint_card or card
          }
        elseif suit_match then
          return {
            dollars = card.ability.extra.money_for_suit,
            message_card = c,
            juice_card = context.blueprint_card or card
          }
        elseif rank_match then
          return {
            dollars = card.ability.extra.money_for_rank,
            message_card = c,
            juice_card = context.blueprint_card or card
          }
        end
      end
    end
  end,

  joker_display_def = function(JokerDisplay)
    return {
      text = {
        { text = "+$" },
        { ref_table = "card.joker_display_values", ref_value = "dollars", retrigger_type = "mult" },
        { text = "?" },
      },
      text_config = { colour = G.C.GOLD },
      calc_function = function(card)
        local dollars = 0
        local _, _, scoring_hand = JokerDisplay.evaluate_hand()
        for _, scoring_card in ipairs(scoring_hand) do
          local suit_matches = 0
          for _, suit in ipairs(PB_UTIL.base_suits) do
            if scoring_card:is_suit(suit) then
              suit_matches = suit_matches + 1
            end
          end
          local rank_matches = 0
          for _, rank in ipairs(PB_UTIL.base_ranks) do
            if PB_UTIL.is_rank(scoring_card, rank) and not scoring_card.debuff then
              rank_matches = rank_matches + 1
            end
          end
          local scoring_card_dollars =
              card.ability.extra.money_for_suit * suit_matches / 4 +
              card.ability.extra.money_for_rank * rank_matches / 13 +
              (card.ability.extra.money_for_both
                - card.ability.extra.money_for_suit
                - card.ability.extra.money_for_rank
              ) * suit_matches / 4 * rank_matches / 13
          dollars = dollars + scoring_card_dollars *
              JokerDisplay.calculate_card_triggers(scoring_card, scoring_hand)
        end
        card.joker_display_values.dollars = dollars
      end
    }
  end,
}
