SMODS.Blind {
  key = 'natural',
  boss = {
    min = 2,
  },
  mult = 1,
  boss_colour = HEX('926fcd'),
  atlas = 'music_blinds_atlas',
  pos = { y = 2 },

  calculate = function(self, blind, context)
    if context.before and not blind.disabled then
      local min
      for _, v in pairs(G.GAME.hands) do
        min = min and (min < v.level and min or v.level) or v.level
      end
      if min and G.GAME.hands[context.scoring_name].level > min then
        for _, v in pairs(context.scoring_hand) do
          v:set_debuff(true)
          v.debuffed_by_blind = true
        end
      end
    end
  end
}
