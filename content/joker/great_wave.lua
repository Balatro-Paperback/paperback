SMODS.Joker {
  key = "great_wave",
  attributes = {
    'retrigger',
    'position'
  },
  rarity = 3,
  pos = { x = 4, y = 2 },
  atlas = "jokers_atlas",
  cost = 8,
  unlocked = false,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,
  soul_pos = nil,

  paperback_credit = {
    coder = { 'oppositewolf' },
  },

  locked_loc_vars = function (self, info_queue, card)
    return {vars = {2, localize("Clubs", 'suits_singular'),}}
  end,

  check_for_unlock = function (self, args)
    if args.type == 'paperback_suit_straight_flushes' then
      return G.GAME.paperback.played_straight_flushes['Clubs'] and G.GAME.paperback.played_straight_flushes['Clubs'] >= 2
    end
  end,

  calculate = function(self, card, context)
    if not card.debuff then
      if context.repetition and context.cardarea == G.play then
        if context.other_card == context.scoring_hand[#context.scoring_hand] then
          if #context.scoring_hand > 1 then
            return {
              message = localize('k_again_ex'),
              repetitions = #context.scoring_hand - 1,
              card = card
            }
          end
        end
      end
    end
  end,

  joker_display_def = function(JokerDisplay)
    return {
      retrigger_function = function(playing_card, scoring_hand, held_in_hand, joker_card)
        if held_in_hand then return 0 end
        if playing_card == JokerDisplay.calculate_rightmost_card(scoring_hand) then
          if #scoring_hand > 1 then
            return (#scoring_hand - 1) * JokerDisplay.calculate_joker_triggers(joker_card)
          end
        end
        return 0
      end
    }
  end,
}
