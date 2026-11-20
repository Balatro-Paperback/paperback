SMODS.Blind {
  key = "joker",
  boss = { min = 3 },
  attributes = { "debuff", "joker", "face" },
  boss_colour = HEX("f1dc69"),
  atlas = "wingding_blinds_atlas",
  pos = { y = 9 },

  in_pool = function(self)
    for i, v in ipairs(G.playing_cards or {}) do
      if v:is_face(true) then return G.GAME.round_resets.ante >= 3 end
    end
    return false
  end,

  calculate = function(self, blind, context)
    if blind.disabled then return end

    if context.debuff_card and context.debuff_card.area == G.jokers then
      -- this delays the debuff long enough for e.g. chicot to disable the blind
      if not blind.effect.active then
        G.E_MANAGER:add_event(Event {
          func = function()
            blind.effect.active = true
            for i = 1, #G.jokers.cards do
              SMODS.recalc_debuff(G.jokers.cards[i])
            end
            return true
          end
        })
      else
        return {
          debuff = true
        }
      end
    end

    if context.press_play then
      for i, v in ipairs(G.hand.highlighted) do
        if v:is_face(true) then
          blind:disable()
        end
      end
    end
  end
}
