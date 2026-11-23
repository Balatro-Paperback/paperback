SMODS.Blind {
  key = "electric",
  boss = { min = 3 },
  attributes = { "enhancements" },
  boss_colour = HEX("c49485"),
  atlas = "wingding_blinds_atlas",
  pos = { y = 4 },

  in_pool = function(self)
    local count = 0
    for i, v in ipairs(G.playing_cards or {}) do
      if next(SMODS.get_enhancements(v)) then
        count = count + 1
      end
    end

    return G.GAME.round_resets.ante >= 3 and count >= 4
  end,

  calculate = function(self, blind, context)
    if blind.disabled then return end

    if context.debuff_hand then
      local enhanced = false
      for _, card in ipairs(context.full_hand) do
        if next(SMODS.get_enhancements(card)) then
          enhanced = true
          break
        end
      end
      if not enhanced then
        return {
          debuff = true,
          debuff_text = localize("paperback_electric_debuff")
        }
      end
    end
  end
}
