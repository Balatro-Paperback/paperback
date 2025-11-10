SMODS.Joker {
  key = 'the_world',
  rarity = 2,
  pos = { x = 0, y = 6 },
  atlas = 'jokers_atlas',
  cost = 9,
  unlocked = false,
  discovered = false,
  blueprint_compat = false,
  eternal_compat = true,
  soul_pos = nil,
  locked_loc_vars = function(self, info_queue, card)
    return { vars = { 12 } }
  end,
  check_for_unlock = function(self, args)
    return args.type == 'ante_up' and args.ante >= 12
  end
}

local function wrap_the_world(ignores, func, context)
  local joker = next(SMODS.find_card('j_paperback_the_world'))

  local previous = {
    hands_played = G.GAME.current_round.hands_played,
    hands_left = G.GAME.current_round.hands_left,
    discards_used = G.GAME.current_round.discards_used,
    discards_left = G.GAME.current_round.discards_left,
  }

  if joker and not ignores then
    for k, _ in pairs(previous) do
      G.GAME.current_round[k] = 0
    end
    if context and (context.discard or context.pre_discard) then
      G.GAME.current_round.discards_left = 1
    end
  end

  local ret, ret2 = func()

  if joker and not ignores then
    for k, v in pairs(previous) do
      G.GAME.current_round[k] = v
    end
  end

  return ret, ret2
end

-- Joker calculations
local calculate_joker_ref = Card.calculate_joker
function Card.calculate_joker(self, context)
  local ignores = (self.config.center.paperback or {}).ignores_the_world

  return wrap_the_world(ignores, function()
    return calculate_joker_ref(self, context)
  end, context)
end

-- Just handles "The House" calculations for now
local stay_flipped_ref = Blind.stay_flipped
function Blind.stay_flipped(self, area, card)
  return wrap_the_world(nil, function()
    return stay_flipped_ref(self, area, card)
  end, nil)
end
