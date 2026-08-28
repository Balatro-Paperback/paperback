SMODS.Joker {
  key = 'subterfuge',
  attributes = {
    'destroy_cards',
    'hands'
  },
  rarity = 3,
  pos = { x = 3, y = 5 },
  pools = {
    Music = true
  },
  atlas = 'jokers_atlas',
  cost = 8,
  unlocked = false,
  discovered = false,
  blueprint_compat = false,
  eternal_compat = true,
  perishable_compat = true,
  soul_pos = nil,

  paperback_credit = {
    coder = { 'oppositewolf' }
  },

  check_for_unlock = function(self, args)
    if args.type == 'paperback_removed_playing_cards' then
      if G.GAME.paperback.round.destroyed_cards_this_round >= 5 then
        return true
      end
    end
  end,

  locked_loc_vars = function(self, info_queue, card)
    return {
      vars = { 5 }
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
