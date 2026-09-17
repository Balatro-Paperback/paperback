SMODS.Back {
  key = 'commander',
  atlas = 'decks_atlas',
  pos = { x = 0, y = 1 },
  unlocked = false,
  paperback_credit = { coder = { 'thermo' } },

  check_for_unlock = function(self, args)
    if args.type == 'modify_deck' then
      return G.playing_cards and #G.playing_cards >= 100
    end
  end,

  locked_loc_vars = function(self, info_queue, card)
    return { vars = { 100 } }
  end,

  calculate = function(self, back, context)
    if context.retrigger_joker_check and PB_UTIL.is_card(context.other_card) then
      if next(G.jokers.cards) and context.other_card == G.jokers.cards[1] then
        return { repetitions = 1 }
      end
    end
  end
}

local move_ref = Moveable.drag
function Moveable.drag(self, offset)
  if self.is and type(self.is) == "function" and self:is(Card) and self.ability.set == "Joker" then
    if G and G.GAME and G.GAME.blind and G.GAME.blind.in_blind and G.GAME.selected_back.effect.center.key == "b_paperback_commander" then
      return
    end
  end
  return move_ref(self, offset)
end
