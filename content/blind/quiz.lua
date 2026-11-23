SMODS.Blind {
  key = "quiz",
  boss = { min = 2 },
  attributes = { "hand_type" },
  boss_colour = HEX("a2eeee"),
  atlas = "wingding_blinds_atlas",
  pos = { y = 16 },

  config = {
    hand_map = {}
  },

  calculate = function(self, blind, context)
    if blind.disabled then return end

    if context.setting_blind then
      for i, v in ipairs(G.handlist) do
        if not blind.effect.hand_map[v] and i ~= #G.handlist then -- second condition helps if you have an odd number of hands
          local temp
          repeat temp = pseudorandom_element(G.handlist, "paperback_painting")
          until not blind.effect.hand_map[temp] and temp ~= v

          blind.effect.hand_map[v] = temp
          blind.effect.hand_map[temp] = v
        end
      end
    end

    if context.modify_hand then
      blind.triggered = true
      local hand = blind.effect.hand_map[context.scoring_name] or context.scoring_name
      hand_chips = mod_chips(G.GAME.hands[hand].chips)
      mult = mod_mult(G.GAME.hands[hand].mult)
      update_hand_text({ sound = 'chips2', modded = true }, { chips = hand_chips, mult = mult })
    end
  end
}
