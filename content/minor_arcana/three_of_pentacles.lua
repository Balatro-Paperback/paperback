PB_UTIL.MinorArcana {
  key = 'three_of_pentacles',
  atlas = 'minor_arcana_atlas',
  pos = { x = 2, y = 6 },
  config = {
    min_highlighted = 3,
    max_highlighted = 3,
  },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.max_highlighted,
      }
    }
  end,

  use = function(self, card)
    local cards = PB_UTIL.get_sorted_by_position(G.hand)
    local target = cards[1]
    local enhancement = target.config.center.key

    PB_UTIL.use_consumable_animation(card, cards, function()
      for i = 2, #cards do
        cards[i]:set_ability(enhancement)
      end
    end)
  end
}
