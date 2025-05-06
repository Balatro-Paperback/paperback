SMODS.Voucher {
  key = 'celtic_cross',
  config = {
    triggered = false
  },
  atlas = 'vouchers_atlas',
  pos = { x = 0, y = 0 },
  discovered = false,
  paperback = {
    requires_minor_arcana = true,
    requires_tags = true,
  },

  loc_vars = function(self, info_queue)
    info_queue[#info_queue + 1] = G.P_CENTERS.p_paperback_minor_arcana_mega
  end,

  calculate = function(self, card, context)
    if context.starting_shop and card.ability.triggered then
      card.ability.triggered = false
      -- Adds a free booster to the shop
      G.E_MANAGER:add_event(Event {
        func = function()
          local booster = SMODS.add_booster_to_shop('p_paperback_minor_arcana_mega')
          booster.ability.couponed = true
          booster:set_cost()
          return true
        end
      })
    end

    if context.end_of_round and context.main_eval and G.GAME.blind.boss then
      card.ability.triggered = true
    end
  end
}
