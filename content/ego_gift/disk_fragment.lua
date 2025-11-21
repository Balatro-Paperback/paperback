PB_UTIL.EGO_Gift {
  key = 'disk_fragment',
  config = {
    sin = 'gluttony',
    cards = 2,
  },
  atlas = 'ego_gift_atlas',
  pos = { x = 3, y = 1 },
  soul_pos = { x = 3, y = 4 },

  ego_loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.cards
      }
    }
  end,

  ego_gift_calc = function(self, card, context)
    if context.setting_blind and not G.GAME.blind.boss then
      local no_planets = true
      for _, c in ipairs(G.consumeables.cards) do
        if c.ability.set == 'Planet' then
          no_planets = false
        end
      end
      if no_planets then
        for i = 1, card.ability.cards, 1 do
          G.E_MANAGER:add_event(Event({
            func = function()
              local new_card = SMODS.add_card {
                set = 'Planet',
                key_append = 'paperback_disk_fragment',
                edition = 'e_negative'
              }
              PB_UTIL.set_sell_value(new_card, 1)
              return true
            end
          }))
        end
        return {
          colour = G.C.BLUE
        }
      end
    end
  end,
}
