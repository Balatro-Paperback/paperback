-- technicallyyy i'm pretty sure it's in the same node position each time
-- so i could just do like, nodes[1].nodes[1].nodes[2] or whatever
-- but that would look so bad and might not actually be consistent
-- so i'm doing this instead
local function find_reroll_button(nodes)
  for _, ui in ipairs(nodes or G.shop.definition.nodes) do
    if ui.config and ui.config.func == 'can_reroll' then
      return ui
    elseif ui.nodes then
      local ret = find_reroll_button(ui.nodes)
      if ret then return ret end
    end
  end
end

PB_UTIL.MinorArcana {
  key = 'knight_of_pentacles',
  attributes = {
    'reroll',
    'shop',
    'economy'
  },
  atlas = 'minor_arcana_atlas',
  pos = { x = 4, y = 7 },
  paperback_credit = {
    coder = { 'metanite' }
  },

  can_use = function(self, card)
    return (G.STATE == G.STATES.SHOP) or (G.STATE == G.STATES.SMODS_BOOSTER_OPENED)
  end,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        (G.STATE == G.STATES.MENU and 5) or G.GAME.round_resets.reroll_cost,
        (G.STATE == G.STATES.MENU and 5) or G.GAME.current_round.reroll_cost
      }
    }
  end,

  use = function(self, card, area)
    G.E_MANAGER:add_event(Event({
      func = function()
        if G.STATE ~= G.STATES.SHOP then
          return false
        end
        G.E_MANAGER:add_event(Event({
          trigger = "after",
          delay = 2,
          func = function()
            G.GAME.current_round.reroll_cost = G.GAME.round_resets.reroll_cost
            G.GAME.current_round.reroll_cost_increase = 0
            local button = find_reroll_button()
            if not button then return true end -- just in case...
            button.nodes[1].config.button_UIE:juice_up(0.2)
            play_sound('timpani')
            save_run() -- make sure the new cost gets saved
            return true
          end,
          blockable = false
        }))
        return true
      end,
      blocking = false
    }))
  end
}
