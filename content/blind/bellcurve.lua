SMODS.Blind {
  key = "bellcurve",
  boss = { min = 3 },
  attributes = { "blindsize" },
  boss_colour = HEX("be3f5c"),
  atlas = "wingding_blinds_atlas",
  pos = { y = 1 },

  calculate = function(self, blind, context)
    if context.blind_disabled then
      return { blindsize = -G.GAME.paperback.bellcurve_excess }
    end
    if blind.disabled then return end

    if context.setting_blind then
      return { blindsize = G.GAME.paperback.bellcurve_excess }
    end
  end,
}
