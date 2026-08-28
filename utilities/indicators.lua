local indicators = {
  flags = {
    { key = "perma_mult", pos = { x = 0, y = 0 } },
    { key = "perma_x_mult", pos = { x = 1, y = 0 } },
    { key = "perma_bonus", pos = { x = 2, y = 0 } },
    { key = "perma_x_chips", pos = { x = 3, y = 0 } },
    { key = "perma_p_dollars", pos = { x = 4, y = 0 } },
    { key = "perma_paperback_plus_odds", pos = { x = 5, y = 0 } },
    { key = "perma_repetitions", pos = { x = 6, y = 0 } },
  },
  pins = {
    { key = "perma_h_mult", pos = { x = 0, y = 1 } },
    { key = "perma_h_x_mult", pos = { x = 1, y = 1 } },
    { key = "perma_h_chips", pos = { x = 2, y = 1 } },
    { key = "perma_h_x_chips", pos = { x = 3, y = 1 } },
    { key = "perma_h_dollars", pos = { x = 4, y = 1 } },
    { key = "perma_paperback_h_plus_odds", pos = { x = 5, y = 1 } },
    -- { key = "perma_h_repetitions", pos = { x = 6, y = 1 } },
  }
}

-- Registers the upgrade indicators atlas
SMODS.Atlas {
  key = "indicators",
  px = 71,
  py = 95,
  path = "Indicators.png",

  inject = function(self)
    SMODS.Atlas.inject(self)

    for _, side in pairs(indicators) do
      for _, v in ipairs(side) do
        v.sprite = Sprite(0, 0, G.CARD_W, G.CARD_H, self, v.pos)
      end
    end
  end
}

local FLAG_OFFSET_X = -8
local PIN_OFFSET_X = -1
local PIN_OFFSET_Y = 1
local HEIGHT = 7
local GAP = 1

local function should_draw_indicator(card, key)
  return card and card.ability
      and type(card.ability[key]) == "number"
      and card.ability[key] > 0
      and card.area and card.area.config.type ~= 'deck'
      and card.facing == 'front'
end

local function draw_single_indicator(card, sprite, x_offset, y_offset)
  x_offset = (card.T.w / 71) * (x_offset or 0) * card.T.scale
  y_offset = (card.T.h / 95) * (y_offset or 0) * card.T.scale

  sprite.role.draw_major = card
  sprite:draw_shader(
    (card.greyed and 'played') or 'dissolve',
    nil, nil, nil,
    card.children.center,
    nil, nil,
    x_offset, y_offset
  )
end

local function draw_indicators(indicators, card, x_offset, y_offset)
  local y = GAP

  for _, v in ipairs(indicators) do
    if should_draw_indicator(card, v.key) then
      draw_single_indicator(
        card,
        v.sprite,
        x_offset,
        y + (y_offset or 0)
      )

      y = y + HEIGHT + GAP
    end
  end
end

SMODS.DrawStep {
  key = "indicators_front",
  order = 40,
  func = function(card)
    if PB_UTIL.config.upgrade_indicators and card and card.ability then
      draw_indicators(indicators.pins, card, PIN_OFFSET_X, PIN_OFFSET_Y)
    end
  end
}

SMODS.DrawStep {
  key = "indicators_back",
  order = -30,
  func = function(card)
    if PB_UTIL.config.upgrade_indicators and card and card.ability then
      draw_indicators(indicators.flags, card, FLAG_OFFSET_X)
    end
  end
}
