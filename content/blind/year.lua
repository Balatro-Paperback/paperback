SMODS.Blind {
  key = "year",
  boss = { min = 5 },
  mult = 1.5,
  attributes = { "large_blind", "economy" },
  boss_colour = HEX("cb88bc"),
  atlas = "wingding_blinds_atlas",
  pos = { y = 24 },

  calculate = function(self, blind, context)
    if blind.disabled then return end

    if context.setting_blind then
      local base = get_blind_amount(G.GAME.round_resets.ante)
      local multi = 0.2 * math.floor(G.GAME.dollars / 5)
      if multi > 0 then
        G.E_MANAGER:add_event(Event {
          trigger = "after",
          func = function()
            SMODS.calculate_effect({ blindsize = base * multi}, G.GAME.blind)
            return true
          end
        })
      end
    end
  end
}
