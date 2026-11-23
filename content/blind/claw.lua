SMODS.Blind {
  key = "claw",
  boss = { min = 4 },
  attributes = {
    "debuff",
    "rank",
    "ace",
    "three",
    "five",
    "seven",
    "nine"
  },
  boss_colour = HEX("b36e74"),
  atlas = "wingding_blinds_atlas",
  pos = { y = 2 },

  calculate = function(self, blind, context)
    if blind.disabled then return end

    if context.debuff_card and context.debuff_card.area ~= G.jokers then
      local id = context.debuff_card:get_id() or 0
      if (id >= 2 and id <= 10 and id % 2 == 1) or id == 14 then
        return { debuff = true }
      end
    end
  end
}
