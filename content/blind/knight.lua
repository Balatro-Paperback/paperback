SMODS.Blind {
  key = "knight",
  boss = { min = 3 },
  mult = 1.5,
  attributes = { "debuff", "suit", "light" },
  boss_colour = HEX("acac85"),
  atlas = "wingding_blinds_atlas",
  pos = { y = 10 },

  calculate = function(self, blind, context)
    if blind.disabled then return end

    if context.debuff_card and context.debuff_card.area ~= G.jokers then
      if context.debuff_card:is_suit_shade("light", true) then
        return { debuff = true }
      end
    end
  end
}
