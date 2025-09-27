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
      card.ability.cards
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
          local new_card = SMODS.create_card {
            set = 'Planet',
            edition = 'e_negative',
          }
          G.consumeables:emplace(new_card)
        end
        return {
          colour = G.C.BLUE
        }
      end
    end
  end,
}
