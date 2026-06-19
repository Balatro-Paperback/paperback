PB_UTIL.MinorArcana {
  key = 'eight_of_wands',
  atlas = 'minor_arcana_atlas',
  pos = { x = 0, y = 3 },
  config = {
    base_cost = 15,
    cost_per_joker = 5,
    min_jokers = 5,
  },
  attributes = {
    'lose_economy',
    'generation',
    'tag',
    'negative',
    'joker'
  },
  paperback_credit = {
    coder = { 'srockw' }
  },

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_TAGS.tag_negative

    return {
      vars = {
        card.ability.base_cost,
        card.ability.cost_per_joker,
        G.GAME.starting_params.joker_slots,
        card.ability.base_cost +
        (card.ability.cost_per_joker * math.max(#(G.jokers and G.jokers.cards or {}) - G.GAME.starting_params.joker_slots, 0)),
      }
    }
  end,

  can_use = function(self, card)
    return true
  end,

  use = function(self, card, area)
    PB_UTIL.use_consumable_animation(card, nil, function()
      PB_UTIL.add_tag('tag_negative')
      ease_dollars(-(card.ability.base_cost + (card.ability.cost_per_joker * math.max(#(G.jokers and G.jokers.cards or {}) - G.GAME.starting_params.joker_slots, 0))))
    end)
  end
}
