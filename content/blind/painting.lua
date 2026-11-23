SMODS.Blind {
  key = "painting",
  boss = { min = 5 },
  mult = 1.5,
  attributes = { "suit" },
  boss_colour = HEX("aaddc9"),
  atlas = "wingding_blinds_atlas",
  pos = { y = 15 },

  calculate = function(self, blind, context)
    if blind.disabled then return end

    if context.debuff_hand and PB_UTIL.get_unique_suits(context.full_hand, nil, true) < 4 then
      return {
        debuff = true,
        debuff_text = localize("paperback_painting_debuff")
      }
    end
  end
}
