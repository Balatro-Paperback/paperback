SMODS.Joker {
  key = "doppler_radar",
  attributes = {
    'generation',
    'planet'
  },
  rarity = 2,
  pos = { x = 16, y = 12 },
  atlas = "jokers_atlas",
  cost = 7,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,
  paperback_credit = {
    coder = { 'thermo' }
  },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        localize('k_planet')
      }
    }
  end,

  calculate = function(self, card, context)
    if context.end_of_round and context.main_eval then
      local created_consumable = #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit
      for i = 1, G.consumeables.config.card_limit, 1 do
        G.E_MANAGER:add_event(Event({
          func = (function()
            if PB_UTIL.try_spawn_card { set = 'Planet' } then
              card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil,
                {
                  message = localize('k_plus_planet'),
                  colour = G.C.SECONDARY_SET.Planet
                })
            end
            return true
          end),
          message = localize('k_plus_planet')
        }))
      end
    end
  end
}
