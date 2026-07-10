SMODS.Joker {
  key = "malibu",
  config = {
    extra = {
      multiplier = 10
    }
  },
  attributes = {
    'chips'
  },
  rarity = 2,
  pos = { x = 24, y = 7 },
  atlas = "jokers_atlas",
  cost = 7,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,
  paperback_credit = {
    coder = { 'ThermoDyn' }
  },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.multiplier
      }
    }
  end,

  calculate = function(self, card, context)
    if context.joker_main then
      local chip_table = {}
      for _, c in ipairs(context.scoring_hand) do
        table.insert(chip_table, c:get_chip_bonus())
      end
      return {
        chips = math.min(table.unpack(chip_table)) * card.ability.extra.multiplier
      }
    end
  end
}
