SMODS.Joker {
  key = "tropic_birds",
  config = {
    extra = {
      triggered = false,
      repetitions = 1,
      rank = "Ace"
    }
  },
  attributes = {
    'retrigger',
    'rank',
    'ace'
  },
  rarity = 1,
  pos = { x = 25, y = 4 },
  atlas = "jokers_atlas",
  cost = 6,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,
  paperback_credit = {
    coder = { 'thermo' }
  },
  unlocked = false,

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.rank } }
  end,

  check_for_unlock = function(self, args)
    if args.type == 'round_win' then
      return G.GAME.last_hand_played == 'High Card' and G.GAME.paperback.hand_only_scored_aces
    end
  end,

  locked_loc_vars = function (self, info_queue, card)
    return { vars = { localize('High Card', 'poker_hands') } }
  end,

  calculate = function(self, card, context)
    if context.before then
      for _, v in ipairs(context.scoring_hand) do
        if PB_UTIL.is_rank(v, card.ability.extra.rank) then
          card.ability.extra.triggered = true
          break
        end
      end
    end
    if context.repetition and context.cardarea == G.play and card.ability.extra.triggered then
      if context.other_card == context.scoring_hand[1] or context.other_card == context.scoring_hand[#context.scoring_hand] then
        return {
          repetitions = card.ability.extra.repetitions
        }
      end
    end
    if context.after and card.ability.extra.triggered then
      card.ability.extra.triggered = false
    end
  end
}
