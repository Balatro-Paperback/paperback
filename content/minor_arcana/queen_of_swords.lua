PB_UTIL.MinorArcana {
  key = 'queen_of_swords',
  config = {
    targets = 3,
  },
  atlas = 'minor_arcana_atlas',
  pos = { x = 5, y = 5 },

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

    while #targets < card.ability.targets and #possible_targets > 0 do
      local target = pseudorandom_element(possible_targets, pseudoseed('queen_of_swords'))
      table.insert(targets, target)
      -- Get rid of possible targets with the same suit as chosen `target`
      for i = #possible_targets, 1, -1 do
        if possible_targets[i].base.suit == target.base.suit then
          table.remove(possible_targets, i)
        end
      end
    end

    PB_UTIL.use_consumable_animation(card, G.hand.highlighted, function()
      for _, v in ipairs(targets) do
        assert(SMODS.change_base(v, ref))
      end
    end)
  end
}
