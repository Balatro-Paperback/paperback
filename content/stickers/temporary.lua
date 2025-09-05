SMODS.Sticker {
  key = 'temporary',
  atlas = 'stickers_atlas',
  pos = { x = 1, y = 0 },
  badge_colour = G.C.PAPERBACK_TEMPORARY,
  should_apply = false,
  discovered = true,
  rate = 0,

  draw = function(self, card)
    -- Don't draw the shine over the sticker
    G.shared_stickers[self.key].role.draw_major = card
    G.shared_stickers[self.key]:draw_shader('dissolve', nil, nil, nil, card.children.center)
  end,
}

-- Hook end_round to destroy Jokers and Consumables with this sticker
local end_round_ref = end_round
function end_round()
  -- Destroy jokers
  for _, v in ipairs(G.jokers and G.jokers.cards or {}) do
    if v.ability.paperback_temporary then
      SMODS.destroy_cards(v)
    end
  end

  local to_destroy = {}

  -- Destroy consumables
  for _, v in ipairs(G.consumeables and G.consumeables.cards or {}) do
    if v.ability.paperback_temporary then
      to_destroy[#to_destroy + 1] = v
    end
  end

  -- Destroy playing cards
  for _, v in ipairs(G.playing_cards or {}) do
    if v.ability.paperback_temporary then
      to_destroy[#to_destroy + 1] = v
    end
  end

  if #to_destroy > 0 then
    SMODS.destroy_cards(to_destroy)
  end

  return end_round_ref()
end
