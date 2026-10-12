SMODS.Consumable {
  key = 'apostle_of_cups',
  config = {
    extra = {
      delta = -1
    }
  },
  attributes = {
    'modify_card',
    'editions',
    'negative',
    'joker_slot'
  },
  set = "Spectral",
  atlas = 'spectral_atlas',
  pos = { x = 0, y = 0 },

  hidden = true,
  soul_set = "paperback_minor_arcana",
  soul_rate = 0.001,

  loc_vars = function(self, info_queue, card)
    return {
      vars = { card.ability.extra.delta }
    }
  end,

  can_use = function(self, card)
    return G.hand and G.jokers
        and #G.hand.highlighted == 1
        and not G.hand.highlighted[1].edition
  end,

  use = function(self, card, area, copier)
    local other_card = G.hand.highlighted[1]

    PB_UTIL.use_consumable_animation(card, nil, function()
      other_card:set_edition('e_negative')
      G.jokers:change_size(card.ability.extra.delta)
    end)
  end
}
