PB_UTIL.MinorArcana {
  key = 'eight_of_swords',
  config = {
    max_highlighted = 3,
  },
  attributes = {
    'modify_card',
    'paperclip'
  },
  atlas = 'minor_arcana_atlas',
  pos = { x = 0, y = 5 },
  paperback = {
    requires_paperclips = true
  },
  paperback_credit = {
    coder = { 'dowfrin' }
  },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.max_highlighted,
      }
    }
  end,

  use = function(self, card, area)
    PB_UTIL.use_consumable_animation(card, G.hand.highlighted, function()
      for _, v in ipairs(G.hand.highlighted) do
        local clip = PB_UTIL.poll_paperclip('eight_of_swords')
        PB_UTIL.set_paperclip(v, clip)
      end
    end)
  end
}
