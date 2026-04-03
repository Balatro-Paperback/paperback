SMODS.Joker {
  key = "backpack",
  attributes = {
    'joker',
  },
  rarity = 1,
  pos = { x = 4, y = 6 },
  atlas = 'jokers_atlas',
  cost = 4,
  unlocked = true,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,
  paperback_credit = {
    coder = { 'srockw' }
  },

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.p_buffoon_normal_1
  end,

  calculate = function(self, card, context)
    if context.starting_shop then
      G.E_MANAGER:add_event(Event {
        func = function()
          local key = 'p_buffoon_normal_' .. pseudorandom('backpack', 1, 2)
          local booster = SMODS.add_booster_to_shop(key)
          booster.ability.couponed = true
          booster:set_cost()
          return true
        end
      })

      return {
        message = localize('paperback_supplies_ex'),
        colour = G.C.CHIPS
      }
    end
  end
}
