SMODS.Joker {
  key = "joker_crossing",
  rarity = 2,
  pos = { x = 12, y = 8 },
  atlas = "jokers_atlas",
  cost = 8,
  unlocked = true,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,
  config = { extra = { odds = 3 } },

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
    if context.repetition and context.cardarea == G.play then
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
