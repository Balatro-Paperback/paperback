SMODS.Blind {
  key = "alphabet",
  boss = { min = 2 },
  attributes = {
    "debuff",
    "rank",
    "ace",
    "jack",
    "queen",
    "king"
  },
  boss_colour = HEX("86375d"),
  atlas = "wingding_blinds_atlas",
  pos = { y = 0 },

  calculate = function(self, blind, context)
    if blind.disabled then return end

    if context.debuff_card and context.debuff_card.area ~= G.jokers then
      local id = context.debuff_card:get_id() or 0
      if id >= 11 and id <= 14 then return { debuff = true } end
    end
  end
}
