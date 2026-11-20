SMODS.Blind {
  key = "hunger",
  boss = { min = 1 },
  attributes = {
    "debuff",
    "joker",
    "food"
  },
  boss_colour = HEX("e7aa76"),
  atlas = "wingding_blinds_atlas",
  pos = { y = 7 },

  calculate = function(self, blind, context)
    if blind.disabled then return end

    if context.debuff_card and context.debuff_card.area == G.jokers then
      if context.debuff_card:has_attribute("food") then return { debuff = true } end
    end
  end
}
