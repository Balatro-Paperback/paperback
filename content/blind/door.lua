SMODS.Blind {
  key = "door",
  boss = { min = 2 },
  attributes = { "hand_type" },
  boss_colour = HEX("ffa7a7"),
  atlas = "wingding_blinds_atlas",
  pos = { y = 3 },

  config = {
    required_hand = "High Card"
  },

  calculate = function(self, blind, context)
    if blind.disabled then return end

    if context.before and G.GAME.current_round.hands_played == 0 then
      blind.effect.required_hand = context.scoring_name
    end

    if context.debuff_hand and not next(context.poker_hands[blind.effect.required_hand]) then
      return {
        debuff = true,
        debuff_text = localize {
          type = "variable",
          key = "paperback_door_debuff",
          vars = { localize(blind.effect.required_hand, "poker_hands") }
        }
      }
    end
  end
}
