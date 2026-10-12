SMODS.Joker {
  key = "journal",
  config = {
    extra = {
      chips = 0,
      next_chips = 0,
    }
  },
  attributes = {
    'chips'
  },
  paperback_credit = {
    coder = { 'thermo' }
  },
  rarity = 2,
  pos = { x = 5, y = 11 },
  atlas = "jokers_atlas",
  cost = 6,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.chips
      }
    }
  end,

  calculate = function(self, card, context)
    if context.joker_main then
      local chips = card.ability.extra.chips
      card.ability.extra.chips = card.ability.extra.next_chips

      return {
        chips = chips
      }
    end

    if context.paperback and context.paperback.before_joker_effects then
      card.ability.extra.next_chips = hand_chips
    end
  end
}
