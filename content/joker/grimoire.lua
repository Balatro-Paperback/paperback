SMODS.Joker {
  key = "grimoire",
  config = {
    extra = {
      booster = 'p_paperback_ego_gift_normal_1'
    }
  },
  attributes = {
    'ego_gift',
    'consumable',
    'big_blind',
    'booster',
    'shop'
  },
  rarity = 3,
  pos = { x = 14, y = 13 },
  atlas = "jokers_atlas",
  cost = 8,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,
  paperback = {
    requires_ego_gifts = true
  },
  paperback_credit = {
    coder = { 'thermo' }
  },
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.extra.booster]
  end,
  calculate = function(self, card, context)
    if context.starting_shop and G.GAME.blind:get_type() == "Big" then
      G.E_MANAGER:add_event(Event {
        func = function()
          SMODS.add_booster_to_shop(card.ability.extra.booster)
          return true
        end
      })
      return nil, true
    end
  end
}
