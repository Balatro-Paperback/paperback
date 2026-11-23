SMODS.Blind {
  key = "sowing",
  boss = { min = 3 },
  boss_colour = HEX("5d7dc4"),
  atlas = "wingding_blinds_atlas",
  pos = { y = 18 },

  in_pool = function(self, args)
    return (G.GAME.round_resets.ante + 1) % G.GAME.win_ante ~= 0 and G.GAME.round_resets.ante >= 2
  end,

  calculate = function(self, blind, context)
    if blind.disabled then return end

    if context.setting_blind then
      G.GAME.paperback.sowed_ranks = {} -- THE REAPING CHECKS IF THIS IS NIL. DO NOT INITIALIZE IT IN THE INIT_GAME_OBJECT FUNCTION. thank you :3
    end

    if context.individual and context.cardarea == G.play and not SMODS.has_no_rank(context.other_card) then
      G.GAME.paperback.sowed_ranks[context.other_card.base.value] = true
    end
  end
}
