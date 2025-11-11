SMODS.Joker {
  key = 'subterfuge',
  rarity = 3,
  pos = { x = 3, y = 5 },
  pools = {
    Music = true
  },
  atlas = 'jokers_atlas',
  cost = 8,
  unlocked = false,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,
  soul_pos = nil,
  check_for_unlock = function(self, args)
    if G.GAME.paperback.destroyed_cards_this_round >= 6 then
      return true
    end
  end,

  locked_loc_vars = function(self, info_queue, card)
    return {
      vars = { 6 }
    }
  end,

  calculate = function(self, card, context)
    if not context.blueprint and context.destroy_card and (context.cardarea == G.play or context.cardarea == 'unscored') then
      -- Destroy all cards in first hand
      if G.GAME.current_round.hands_played == 0 then
        if context.destroy_card == context.full_hand[#context.full_hand] then
          return {
            remove = true,
            message = localize('paperback_destroyed_ex'),
            colour = G.C.RED
          }
        else
          return {
            remove = true,
          }
        end
      end
    end
  end
}

local calc_context_ref = SMODS.calculate_context
function SMODS.calculate_context(context, return_table)
  if context.remove_playing_cards then
    for _, v in ipairs(context.removed or {}) do
      G.GAME.paperback.destroyed_cards_this_round = G.GAME.paperback.destroyed_cards_this_round + 1
    end
  end
  if context.end_of_round then
    G.GAME.paperback.destroyed_cards_this_round = 0
  end

  return calc_context_ref(context, return_table)
end
