PB_UTIL.MinorArcana {
  key = 'queen_of_swords',
  config = {
    targets = 3,
  },
  atlas = 'minor_arcana_atlas',
  pos = { x = 5, y = 5 },
  paperback_credit = {
    coder = { 'dowfrin' }
  },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.targets
      }
    }
  end,

  can_use = function(self, card)
    return #G.hand.highlighted == 1 and not SMODS.has_no_suit(G.hand.highlighted[1])
  end,

  use = function(self, card, area)
    local ref = G.hand.highlighted[1].base.suit
    local targets = {}
    local possible_targets = {}
    -- Collect the possible targets
    for _, c in ipairs(G.playing_cards) do
      if not SMODS.has_no_suit(c) and c.base.suit ~= ref then
        table.insert(possible_targets, c)
      end
    end

    local shake_deck = false
    while #targets < card.ability.targets and #possible_targets > 0 do
      local target = pseudorandom_element(possible_targets, pseudoseed('queen_of_swords'))
      table.insert(targets, target)
      if target.area == G.deck then
        shake_deck = true
      end
      -- Get rid of possible targets with the same suit as chosen `target`
      for i = #possible_targets, 1, -1 do
        if possible_targets[i].base.suit == target.base.suit then
          table.remove(possible_targets, i)
        end
      end
    end

    PB_UTIL.use_consumable_animation(card, G.hand.highlighted, function()
      for _, v in ipairs(targets) do
        v:juice_up()
        assert(SMODS.change_base(v, ref))
      end
      if shake_deck then G.deck.cards[1]:juice_up() end
    end)
  end
}
