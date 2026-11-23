SMODS.Tag {
  key = 'angel_investment',
  config = {
    money = 1,
    every = 5,
    max = 100,
  },
  attributes = {
    'economy'
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

if next(SMODS.find_mod("allinjest")) then
  SMODS.Tag {
    key = "seraphim",
    config = {
      rounds = 3,
      aij = { upgrade = "paperback_angel_investment" }
    },
    attributes = {
      "economy"
    },
    atlas = "tags_atlas",
    pos = { x = 0, y = 1 },
    discovered = false,

    in_pool = function(self, args)
      return false
    end,

    loc_vars = function(self, info_queue, tag)
      local r = tag.ability.rounds or 3
      return { vars = { r, r > 1 and "s" or "" } }
    end,

    set_ability = function(self, tag)
      tag.ability.rounds = self.config.rounds
    end,

    apply = function(self, tag, context)
      if context.type == "paperback_seraphim_cashout" then
        tag.ability.rounds = tag.ability.rounds - 1
        if tag.ability.rounds == 0 then
          tag:yep("+", G.C.GOLD, function() return true end)
          tag.triggered = true
        end
        return {
          dollars = context.dollars,
          condition = localize("paperback_seraphim_cashout"),
          pos = tag.pos,
          tag = tag
        }
      end
    end
  }
end
