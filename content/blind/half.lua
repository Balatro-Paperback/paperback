SMODS.Blind {
  key = 'half',
  boss = {
    min = 2
  },
  boss_colour = HEX('D1AB88'),
  atlas = 'music_blinds_atlas',
  pos = { y = 6 },

  calculate = function(self, blind, context)
    if context.mod_probability then
      return {
        denominator = context.denominator * 2
      }
    end
  end
}
