SMODS.Tag {
  key = 'high_risk',
  atlas = 'tags_atlas',
  pos = { x = 3, y = 0 },
  discovered = false,
  config = {
    money = 25
  },
  attributes = {
    'economy',
    'boss_blind',
    'large_blind'
  },

  in_pool = function(self, args)
    return false
  end,

  loc_vars = function(self, info_queue, tag)
    return {
      vars = {
        tag.config.money
      }
    }
  end,

  apply = function(self, tag, context)
    if context.type == 'round_start_bonus' and G.GAME.blind.boss then
      tag:yep('+', G.C.MULT, function()
        G.GAME.blind.chips = G.GAME.blind.chips * 2
        G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
        G.GAME.blind:wiggle()
        return true
      end)

      ease_dollars(tag.config.money)

      tag.triggered = true
      return true
    end
  end
}
