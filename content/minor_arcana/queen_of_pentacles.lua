PB_UTIL.MinorArcana {
  key = 'queen_of_pentacles',
  atlas = 'minor_arcana_atlas',
  pos = { x = 5, y = 7 },
  config = {
    min_highlighted = 2,
    max_highlighted = 2,
  },
  attributes = {
    'modify_card',
    'rank'
  },
  paperback_credit = {
    coder = { 'metanite' }
  },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.max_highlighted,
      }
    }
  end,

  can_use = function(self, card)
    if #G.hand.highlighted <= card.ability.max_highlighted and #G.hand.highlighted >= card.ability.min_highlighted then
      local cards = PB_UTIL.get_sorted_by_position(G.hand)
      local source = cards[#cards]
      return not SMODS.has_no_rank(source)
    end
  end,

  use = function(self, card)
    local cards = PB_UTIL.get_sorted_by_position(G.hand)
    local source = cards[#cards]
    local rank = source.base.value

    PB_UTIL.use_consumable_animation(card, cards, function()
      for i = 1, #cards - 1 do
        SMODS.change_base(cards[i], nil, rank)
      end
    end)
  end
}
