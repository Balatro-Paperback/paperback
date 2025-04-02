SMODS.Blind {
  key = 'flat',
  boss = {
    min = 1,
  },
  boss_colour = HEX('4680B8'),
  atlas = 'music_blinds_atlas',
  pos = { y = 4 },

  calculate = function(self, blind, context)
    if blind.disabled then
      return
    end

    if context.after then
      PB_UTIL.use_consumable_animation(nil, context.full_hand, function()
        for k, v in pairs(context.full_hand) do
          assert(SMODS.modify_rank(v, -1))
        end
      end)
    end
  end
}
