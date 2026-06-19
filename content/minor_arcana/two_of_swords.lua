PB_UTIL.MinorArcana {
  key = 'two_of_swords',
  config = {
    max_highlighted = 3,
  },
  attributes = {
    'modify_card',
    'suit'
  },
  atlas = 'minor_arcana_atlas',
  pos = { x = 1, y = 4 },
  paperback_credit = {
    coder = { 'dowfrin' }
  },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.max_highlighted,
        localize(G.GAME.paperback.last_scored_suit, 'suits_plural'),
        colours = { G.C.SUITS[G.GAME.paperback.last_scored_suit] }
      }
    }
  end,

  use = function(self, card, area)
    PB_UTIL.use_consumable_animation(card, G.hand.highlighted, function()
      for _, v in ipairs(G.hand.highlighted) do
        assert(SMODS.change_base(v, G.GAME.paperback.last_scored_suit, nil))
      end
    end)
  end
}
