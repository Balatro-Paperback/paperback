PB_UTIL.MinorArcana {
  key = 'eight_of_cups',
  config = {
    max_highlighted = 4
  },
  atlas = 'minor_arcana_atlas',
  pos = { x = 0, y = 1 },
  unlocked = true,
  discovered = true,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.max_highlighted
      }
    }
  end,

  use = function(self, card, area)
    local pool = {}

    if PB_UTIL.get_unique_suits(G.hand.highlighted, nil, true) >= card.ability.max_highlighted then
      -- If every suit highlighted is different, include all suits in the pool
      for k, v in pairs(SMODS.Suits) do
        pool[k] = v
      end
    else
      -- Otherwise, only include suits currently in the deck
      for k, v in pairs(SMODS.Suits) do
        if PB_UTIL.has_suit_in_deck(k, true) then
          pool[k] = v
        end
      end
    end

    -- Remove the highlighted suits from the pool
    for _, v in ipairs(G.hand.highlighted) do
      if not SMODS.has_no_suit(v) then
        pool[v.base.suit] = nil
      end
    end

    -- Pseudorandom element automatically handles the values in a table having an in_pool function
    -- so we pass custom arguments that can be used to include the suit here
    local _, suit = pseudorandom_element(pool, pseudoseed('eight_of_cups'), {
      paperback = {
        eight_of_cups = true
      }
    })

    PB_UTIL.use_consumable_animation(card, G.hand.highlighted, function()
      if suit then
        for _, v in ipairs(G.hand.highlighted) do
          SMODS.change_base(v, suit, nil)
        end
      end
    end)
  end
}
