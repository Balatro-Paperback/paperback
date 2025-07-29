SMODS.Joker {
  key = "the_normal_joker",
  config = {
    extra = {
      rarity = 1
    }
  },
  pools = {
    Music = true
  },
  rarity = 3,
  pos = { x = 11, y = 0 },
  atlas = "jokers_atlas",
  cost = 8,
  unlocked = true,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,

  calculate = function(self, card, context)
    if context.retrigger_joker_check and PB_UTIL.is_card(context.other_card) then
      if context.other_card.config.center.rarity == card.ability.extra.rarity then
        return {
          repetitions = 1
        }
      end
    end
  end
}
