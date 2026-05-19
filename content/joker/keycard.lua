SMODS.Joker {
  key = "keycard",
  config = {
    extra = {
      dollars = 25
    }
  },
  attributes = {
    'economy'
  },
  paperback_credit = {
    coder = { 'thermo' }
  },
  rarity = 2,
  pos = { x = 6, y = 11 },
  atlas = "jokers_atlas",
  cost = 5,
  blueprint_compat = false,
  eternal_compat = false,
  perishable_compat = true,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.dollars
      }
    }
  end,

  calculate = function(self, card, context)
    if context.end_of_round and context.beat_boss and context.main_eval and not context.blueprint then
      PB_UTIL.destroy_joker(card)
      return {
        dollars = card.ability.extra.dollars,
      }
    end
  end
}
