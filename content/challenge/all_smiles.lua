SMODS.Challenge {
  key = 'all_smiles',
  jokers = {
    {
      id = 'j_paperback_you_are_a_fool',
      edition = 'negative'
    },
    {
      id = 'j_paperback_alert',
    },
    {
      id = 'j_smiley',
      eternal = true,
    }
  },
  unlocked = function (self)
    return G.P_CENTERS['j_paperback_you_are_a_fool'].unlocked and G.P_CENTERS['j_paperback_alert'].unlocked
    and G.P_CENTERS['j_smiley'].unlocked
  end,

  rules = {
    custom = {
      { id = "paperback_non_faces_banned_ante", value = 4 }
    }
  },

  deck = {
    cards = PB_UTIL.create_deck {
      suits = { 'Hearts', 'Clubs', 'Spades', 'Diamonds' },
      ranks = {
        'Ace',
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
