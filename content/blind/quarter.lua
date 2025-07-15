SMODS.Blind {
  key = 'quarter',
  boss = {
    min = 1
  },
  boss_colour = HEX("E27A7A"),
  atlas = 'music_blinds_atlas',
  pos = { y = 5 },
  odds = 4,

  loc_vars = function(self)
    local numerator, denominator = PB_UTIL.chance_vars(self, self.key, nil, self.odds)

    return {
      vars = {
        numerator,
        denominator
      }
    }
  end,

  collection_loc_vars = function(self)
    local numerator, denominator = PB_UTIL.chance_vars(self, self.key, nil, self.odds)

    return {
      vars = {
        numerator,
        denominator
      }
    }
  end,

  set_blind = function(self)
    for k, v in pairs(G.playing_cards) do
      if PB_UTIL.chance(self, 'the_quarter', nil, G.GAME.blind.config.blind.odds) then
        SMODS.debuff_card(v, true, 'The Quarter')
      end
    end
  end,

  disable = function(self)
    for k, v in pairs(G.playing_cards) do
      SMODS.debuff_card(v, false, 'The Quarter')
    end
  end,

  defeat = function(self)
    for k, v in pairs(G.playing_cards) do
      SMODS.debuff_card(v, false, 'The Quarter')
    end
  end
}
