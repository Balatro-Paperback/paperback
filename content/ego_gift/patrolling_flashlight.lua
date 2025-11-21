PB_UTIL.EGO_Gift {
  key = 'patrolling_flashlight',
  config = {
    sin = 'envy',
    active = true
  },
  atlas = 'ego_gift_atlas',
  pos = { x = 6, y = 2 },
  soul_pos = { x = 6, y = 5 },

  ego_loc_vars = function(self, info_queue, card)
    if G.consumeables then
      local color = card.ability.active and G.C.GREEN or G.C.RED
      local text = card.ability.active and 'k_active' or 'paperback_inactive'
      return {
        main_end = {
          {
            n = G.UIT.C,
            config = { align = "bm", padding = 0.02 },
            nodes = {
              {
                n = G.UIT.C,
                config = { align = "m", colour = color, r = 0.05, padding = 0.06 },
                nodes = {
                  {
                    n = G.UIT.T,
                    config = {
                      text = localize(text),
                      colour = G.C.UI.TEXT_LIGHT,
                      scale = 0.3
                    }
                  },
                }
              }
            }
          }
        }
      }
    end
  end,

  ego_gift_calc = function(self, card, context)
    if context.using_consumeable and card.ability.active and not context.consumeable.ability.paperback_energized then
      card.ability.active = false
      G.E_MANAGER:add_event(Event({ func = function()
        -- Doesn't need room
        local copy = SMODS.create_card {
          key = context.consumeable.config.center.key,
        }
        copy:add_sticker('paperback_energized', true)
        copy:add_to_deck()
        G.consumeables:emplace(copy)
        return true
      end}))
    end

    if context.end_of_round and G.GAME.blind.boss and context.cardarea == G.consumeables then
      card.ability.active = true
      return {
        message = localize('k_active_ex')
      }
    end
  end
}
