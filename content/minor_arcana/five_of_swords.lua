PB_UTIL.MinorArcana {
  key = 'five_of_swords',
  atlas = 'minor_arcana_atlas',
  pos = { x = 4, y = 4 },
  config = {
    max_highlighted = 1,
  },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.max_highlighted,
      }
    }
  end,

  use = function(self, card)
    local target = PB_UTIL.get_sorted_by_position(G.hand)[1]

    -- Collect which modifiers the target doesn't have
    local modifiers = {}

    if not target.seal then
      modifiers[#modifiers + 1] = 'seal'
    end

    if not target.edition then
      modifiers[#modifiers + 1] = 'edition'
    end

    if target.ability.set ~= "Enhanced" then
      modifiers[#modifiers + 1] = 'enhancement'
    end

    PB_UTIL.use_consumable_animation(card, target, function()
      -- If the target already has all three of these modifiers then this card can override one of them,
      -- otherwise it will only apply one that the target is missing
      local modifier = pseudorandom_element(
        #modifiers > 0 and modifiers or { 'seal', 'edition', 'enhancement' },
        pseudoseed("five_of_swords")
      )

      if modifier == 'seal' then
        local seal = SMODS.poll_seal {
          key = 'five_of_swords_seal',
          guaranteed = true
        }

        target:set_seal(seal, nil, true)
      elseif modifier == 'enhancement' then
        local enhancement = SMODS.poll_enhancement {
          key = 'five_of_swords_enhancement',
          guaranteed = true
        }

        target:set_ability(enhancement)
      elseif modifier == 'edition' then
        local edition = poll_edition('five_of_swords_edition', nil, true, true)

        target:set_edition(edition, true)
      end
    end)
  end
}
