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

  suit_map = {
    Hearts = 0,
    Clubs = 1,
    Diamonds = 2,
    Spades = 3,
    paperback_Stars = 4,
    paperback_Crowns = 5
  },

  in_pool = function(self, args)
    -- for now, never spawn this naturally
    return false
  end
}

-- Ace adjustments to allow for straights with Apostle
SMODS.Rank:take_ownership('Ace',
  {
    next = { '2', 'paperback_Apostle' },
    straight_edge = false
  }
)
