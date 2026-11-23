SMODS.Blind {
  key = 'xray',
  boss = {
    min = 2
  },
  attributes = {
    'face_down',
    'rank',
    'discard'
  },
  boss_colour = HEX('876891'),
  atlas = 'wingding_blinds_atlas',
  pos = { y = 23 },

  config = { ranks = {} },

  disable = function(self)
    for i = 1, #G.hand.cards do
      if G.hand.cards[i].facing == "back" then
        G.hand.cards[i]:flip()
      end
    end
  end,

  calculate = function(self, blind, context)
    if blind.disabled then return end

    if context.stay_flipped and context.to_area == G.hand and not SMODS.has_no_rank(context.other_card) then
      return { stay_flipped = blind.effect.ranks[context.other_card.base.value] }
    end

    if context.discard and not SMODS.has_no_rank(context.other_card) then
      blind.effect.ranks[context.other_card.base.value] = true
    end
  end
}
