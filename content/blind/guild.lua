SMODS.Blind {
  key = "guild",
  boss = { min = 2 },
  attributes = { "lose_economy", "joker" },
  boss_colour = HEX("cf7c48"),
  atlas = "wingding_blinds_atlas",
  pos = { y = 6 },

  calculate = function(self, blind, context)
    if blind.disabled then return end

    if context.debuff_hand and not context.check then
      return { dollars = -#G.jokers.cards }
    end
  end
}
