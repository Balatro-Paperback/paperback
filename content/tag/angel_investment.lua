SMODS.Tag {
  key = 'angel_investment',
  config = {
    money = 1,
    every = 5,
    max = 100,
  },
  atlas = 'tags_atlas',
  pos = { x = 0, y = 0 },
  discovered = false,
  in_pool = function(self, args)
    return false
  end,

  loc_vars = function(self, info_queue)
    local dollars = math.min(self.config.max,
      math.floor(G.GAME.dollars / self.config.every * self.config.money))

    return {
      vars = {
        self.config.money,
        self.config.every,
        self.config.max,
        math.max(0, dollars)
      }
    }
  end,

  apply = function(self, tag, context)
    if context.type == 'immediate' or context.type == 'eval' then
      tag:yep('+', G.C.MONEY, function()
        return true
      end)

      G.E_MANAGER:add_event(Event {
        trigger = 'immediate',
        func = function()
          local dollars = math.min(self.config.max,
            math.floor(G.GAME.dollars / self.config.every * self.config.money))
          ease_dollars(math.max(0, dollars), true)
          return true
        end
      })

      tag.triggered = true
    end
  end
}
