SMODS.Consumable {
  key = 'apostle_of_swords',
  config = {
    extra = {
      ante_mod = -2
    }
  },
  set = "Spectral",
  atlas = 'spectral_atlas',
  pos = { x = 2, y = 0 },

  hidden = true,
  soul_set = "paperback_minor_arcana",
  soul_rate = 0.001,

  can_use = function(self, card)
    -- Prevent destroying eternal jokers
    if #G.jokers.highlighted == 1 then
      return not SMODS.is_eternal(G.jokers.highlighted[1], card)
    end
  end,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.ante_mod
      }
    }
  end,

  use = function(self, card, area)
    local joker = G.jokers.highlighted[1]
    PB_UTIL.destroy_joker(joker, function()
      card:juice_up()
      ease_ante(card.ability.extra.ante_mod)
    end)
  end
}
