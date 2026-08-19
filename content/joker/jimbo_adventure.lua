SMODS.Joker {
  key = "jimbo_adventure",
  attributes = {
    'generation',
    'tag',
    'skip'
  },
  rarity = 1,
  pos = { x = 1, y = 5 },
  atlas = 'jokers_atlas',
  cost = 4,
  unlocked = false,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,
  soul_pos = { x = 2, y = 5 },

  paperback_credit = {
    coder = { 'oppositewolf' },
  },

  check_for_unlock = function (self, args)
    return G.GAME.tags and #G.GAME.tags >= 4
  end,

  locked_loc_vars = function (self, info_queue, card)
    return { vars = { 4 }}
  end,

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
