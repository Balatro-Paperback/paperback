SMODS.Rank {
  key = 'Apostle',
  card_key = 'APOSTLE',
  shorthand = 'T',

  lc_atlas = 'ranks_lc',
  hc_atlas = 'ranks_hc',
  pos = { x = 0 },

  straight_edge = true,
  next = { 'Ace' },
  nominal = 12,
  face = true,

  in_pool = function(self, args)
    -- for now, never spawn this naturally
    return false
  end
}

-- Ace adjustments to allow for straights with Apostle
SMODS.Rank:take_ownership('Ace',
  {
    next = { 'paperback_Apostle', '2' },
    straight_edge = false
  },
  true
)
