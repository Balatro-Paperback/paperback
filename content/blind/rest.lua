SMODS.Blind {
  key = 'rest',
  boss = {
    min = 3
  },
  mult = 1,
  boss_colour = HEX('90CDAF'),
  atlas = 'music_blinds_atlas',
  pos = { y = 8 },
  chance_numerator = 3,
  chance_denominator = 4,

  loc_vars = function(self)
    local numerator, denominator = PB_UTIL.chance_vars(
      self, self.key,
      self.chance_numerator,
      self.chance_denominator
    )

    return {
      vars = {
        numerator,
        denominator
      }
    }
  end,

  collection_loc_vars = function(self)
    local numerator, denominator = PB_UTIL.chance_vars(
      self, self.key,
      self.chance_numerator,
      self.chance_denominator
    )

    return {
      vars = {
        numerator,
        denominator
      }
    }
  end,

  stay_flipped = function(self, area, card)
    if area == G.hand then
      if not card:is_face() and not SMODS.has_no_rank(card) and
          PB_UTIL.chance(card, 'rest', self.chance_numerator, self.chance_denominator) then
        return true
      end
    end
  end,

  disable = function(self)
    for k, v in pairs(G.hand.cards) do
      if v.facing == 'back' then
        v:flip()
      end
      for k, v in pairs(G.playing_cards) do
        v.ability.wheel_flipped = nil
      end
    end
  end
}
