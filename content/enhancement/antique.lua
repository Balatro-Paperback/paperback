SMODS.Enhancement {
  key = 'antique',
  atlas = 'enhancements_atlas',
  pos = { x = 8, y = 0 },
  config = {
    extra = {
      xchips = 1,
      xchips_mod = 0.1
    }
  },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.xchips,
        card.ability.extra.xchips_mod
      }
    }
  end,

  calculate = function(self, card, context)
    if context.cardarea == G.play and context.before then
      card.ability.extra.xchips = card.ability.extra.xchips + card.ability.extra.xchips_mod
      return {
        message = localize('k_upgrade_ex'),
        colour = G.C.CHIPS
      }
    end

    if context.cardarea == G.play and context.main_scoring then
      return {
        xchips = card.ability.extra.xchips
      }
    end
  end
}
