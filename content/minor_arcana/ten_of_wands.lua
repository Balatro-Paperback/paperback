PB_UTIL.MinorArcana {
  key = 'ten_of_wands',
  atlas = 'minor_arcana_atlas',
  pos = { x = 2, y = 3 },
  config = {
    min_highlighted = 3,
    max_highlighted = 3
  },
  attributes = {
    'modify_card',
    'destroy_card',
    'chips',
    'perma_bonus'
  },
  paperback_credit = {
    coder = { 'srockw' }
  },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.max_highlighted
      }
    }
  end,

  use = function(self, card)
    local cards = PB_UTIL.get_sorted_by_position(G.hand)

    local left = table.remove(cards, 1)
    local increase = 0

    for k, v in ipairs(cards) do
      increase = increase + v:get_chip_bonus()
    end

    PB_UTIL.use_consumable_animation(card, G.hand.highlighted, function()
      if left then
        left.ability.perma_bonus = (left.ability.perma_bonus or 0) + increase
      end
      SMODS.destroy_cards(cards)
    end)
  end
}
