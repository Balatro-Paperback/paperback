SMODS.Enhancement {
  key = 'domino',
  atlas = 'enhancements_atlas',
  pos = { x = 4, y = 0 },
  config = {
    extra = {
      scaling = 1
    }
  },
  attributes = {
    'mult',
    'discard',
    'scaling',
    'reset'
  },

  loc_vars = function(self, info_queue, card)
    local count = 0
    for _ in pairs(G.GAME.paperback.domino_ranks) do count = count + 1 end
    return {
      vars = {
        card.ability.extra.scaling,
        card.ability.extra.scaling * count
      }
    }
  end,

  calculate = function(self, card, context)
    if context.cardarea == G.play and context.main_scoring then
      local count = 0
      for _ in pairs(G.GAME.paperback.domino_ranks) do count = count + 1 end
      return {
        mult = card.ability.extra.scaling * count
      }
    end
  end
}
