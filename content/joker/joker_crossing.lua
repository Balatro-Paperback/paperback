SMODS.Joker {
  key = "joker_crossing",
  rarity = 2,
  pos = { x = 12, y = 8 },
  atlas = "jokers_atlas",
  cost = 8,
  unlocked = false,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,
  config = { extra = { odds = 3 } },
  attributes = {
    'retrigger',
    'enhancements',
    'chance',
    'red'
  },

  paperback_credit = {
    coder = { 'dowfrin' },
  },
  
  check_for_unlock = function(self, args)
    if args.type == 'hand_contents' then
      local tally = 0
      for i = 1, #args.cards do
        if SMODS.has_enhancement(args.cards[i], "m_lucky") then
            tally = tally + 1
        end
      end
      return tally >= 5
    end
  end,

  locked_loc_vars = function (self, info_queue, card)
    return {
      vars = {
        5
      }
    }
  end,

  loc_vars = function(self, info_queue, card)
    local numerator, denominator = PB_UTIL.chance_vars(card)

    return {
      vars = {
        numerator,
        denominator
      }
    }
  end,

  calculate = function(self, card, context)
    if context.repetition and (context.cardarea == G.play or context.cardarea == 'unscored') then
      if next(SMODS.get_enhancements(context.other_card)) and PB_UTIL.chance(card, 'joker_crossing') then
        return {
          message = localize('k_again_ex'),
          repetitions = 1,
        }
      end
    end
    if context.repetition and context.cardarea == G.hand then
      if (next(context.card_effects[1]) or #context.card_effects > 1) then
        if next(SMODS.get_enhancements(context.other_card)) and PB_UTIL.chance(card, 'joker_crossing') then
          return {
            message = localize('k_again_ex'),
            repetitions = 1,
          }
        end
      end
    end
  end
}
