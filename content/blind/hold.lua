SMODS.Blind {
  key = 'hold',
  boss = {
    min = 3
  },
  mult = 2,
  boss_colour = HEX('D19EC3'),
  atlas = 'music_blinds_atlas',
  pos = { y = 0 },
  extra_hands = 1,

  stay_flipped = function(self, area, card)
    if area == G.hand and not card.ability.paperback_hold_returned then return true end
  end,

  disable = function(self)
    for _, v in ipairs(G.playing_cards) do
      if v.ability.paperback_hold_returning then v.ability.paperback_hold_returning = nil end
      if v.ability.paperback_hold_returned then v.ability.paperback_hold_returned = nil end
    end
  end,

  defeat = function(self)
    for _, v in ipairs(G.playing_cards) do
      if v.ability.paperback_hold_returning then v.ability.paperback_hold_returning = nil end
      if v.ability.paperback_hold_returned then v.ability.paperback_hold_returned = nil end
    end
  end,

  calculate = function(self, blind, context)
    if blind.disabled then return end

    if context.after then
      for i, v in ipairs(context.full_hand) do
        if not v.ability.paperback_hold_returned then
          v.ability.paperback_hold_returning = true
        end
      end
    end

    if context.drawing_cards then
      local redraw = {}
      for _, v in ipairs(G.discard.cards) do
        if v.ability.paperback_hold_returning then
          redraw[#redraw + 1] = v
        end
      end

      for i, v in ipairs(redraw) do
        v.ability.paperback_hold_returning = nil
        v.ability.paperback_hold_returned = true
        draw_card(G.discard, G.hand, i * 100 / #redraw, "up", true, v)
      end

      if #redraw > 0 then
        return {
          modify = - #redraw
        }
      end
    end
  end,

  set_blind = function(self)
    ease_hands_played(self.extra_hands)
  end,

  loc_vars = function(self)
    return {
      vars = {
        self.extra_hands or 1,
      }
    }
  end,

  collection_loc_vars = function(self)
    return {
      vars = {
        self.extra_hands or 1,
      }
    }
  end
}
