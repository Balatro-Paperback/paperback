SMODS.Enhancement {
  key = 'stained',
  atlas = 'enhancements_atlas',
  pos = { x = 5, y = 0 },
  config = {
    extra = {
      mult_mod = 1,
    }
  },
  attributes = {
    'mult',
    'modify_card',
    'perma_bonus'
  },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.mult_mod
      }
    }
  end,

  calculate = function(self, card, context)
    if context.main_scoring and context.cardarea == G.hand then
      local triggered

      for _, v in ipairs(context.scoring_hand) do
        v.ability.perma_mult = (v.ability.perma_mult or 0)
            + card.ability.extra.mult_mod
            + math.max(0, G.GAME.paperback.stained_inc)

        G.E_MANAGER:add_event(Event {
          func = function()
            v:juice_up()
            return true
          end
        })

        triggered = true
      end

      return triggered and {
        message = localize('k_upgrade_ex'),
        colour = G.C.MULT
      }
    end
  end
}
