SMODS.Blind {
  key = 'lingering',
  boss = {
    min = 1
  },
  attributes = {
    'hands',
    'discard'
  },
  modifies_draw = true,
  boss_colour = HEX('737958'),
  atlas = 'wingding_blinds_atlas',
  pos = { y = 11 },

  loc_vars = function(self)
    local num, den = SMODS.get_probability_vars(G.GAME.blind or self, 1, 3, "paperback_lingering")
    return { vars = { num, den } }
  end,

  vars = { 1, 3 },

  disable = function(self)
    for _, v in ipairs(G.playing_cards) do
      if v.ability.paperback_lingering then v.ability.paperback_lingering = nil end
    end
  end,

  defeat = function(self)
    for _, v in ipairs(G.playing_cards) do
      if v.ability.paperback_lingering then v.ability.paperback_lingering = nil end
    end
  end,

  calculate = function(self, blind, context)
    if blind.disabled then return end

    if context.pre_discard then
      for i, v in ipairs(context.full_hand) do
        if SMODS.pseudorandom_probability(blind, "paperback_lingering", 1, 3) then
          v.ability.paperback_lingering = true
        end
      end
    end

    if context.drawing_cards then
      local redraw = {}
      for _, v in ipairs(G.discard.cards) do
        if v.ability.paperback_lingering then
          redraw[#redraw + 1] = v
        end
      end

      for i, v in ipairs(redraw) do
        v.ability.paperback_lingering = nil
        draw_card(G.discard, G.hand, i * 100 / #redraw, "up", true, v)
      end

      if #redraw > 0 then
        return {
          modify = context.amount - #redraw
        }
      end
    end
  end
}
