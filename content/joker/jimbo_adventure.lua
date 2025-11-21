SMODS.Joker {
  key = "jimbo_adventure",
  rarity = 1,
  pos = { x = 1, y = 5 },
  atlas = 'jokers_atlas',
  cost = 4,
  unlocked = true,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,
  soul_pos = { x = 2, y = 5 },

  calculate = function(self, card, context)
    if context.skip_blind then
      return {
        message = localize('paperback_plus_tag'),
        func = function()
          G.E_MANAGER:add_event(Event({
            trigger = 'before',
            delay = 0.0,
            func = (function()
              PB_UTIL.add_tag(PB_UTIL.poll_tag("jimbo_adventure"))
              return true
            end)
          }))
        end
      }
    end
  end,
}
