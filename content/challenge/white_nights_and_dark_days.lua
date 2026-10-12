SMODS.Challenge {
  unlocked = function (self)
    return G.P_CENTERS['j_paperback_white_night'].unlocked
  end,
  key = 'white_nights_and_dark_days',
  jokers = {
    {
      id = 'j_paperback_white_night'
    }
  },

  deck = {
    cards = PB_UTIL.create_deck {
      suits = { 'Hearts', 'Clubs', 'Spades', 'Diamonds' },
      ranks = {
        'paperback_Apostle',
        'Ace',
        'King',
        'Queen',
        'Jack',
        '10',
        '9',
        '8',
        '7',
        '6',
        '5',
        '4',
        '3',
        '2'
      }
    },
    type = 'Challenge Deck'
  }
}
