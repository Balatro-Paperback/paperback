SMODS.Joker {
  key = "double_dutchman",
  config = {
    extra = {
      odds = 4,
      hands_left = 5
    }
  },
  rarity = 3,
  pos = { x = 11, y = 3 },
  atlas = "jokers_atlas",
  cost = 8,
  blueprint_compat = false,
  eternal_compat = false,
  perishable_compat = true,
  pools = {
    Food = true
  },

  loc_vars = function(self, info_queue, card)
    local numerator, denominator = PB_UTIL.chance_vars(card)

    return {
      vars = {
        numerator,
        denominator,
        card.ability.extra.hands_left
      }
    }
  end,

  calculate = function(self, card, context)
    if context.after and not context.blueprint then
      for _, v in ipairs(G.hand.cards) do
        if PB_UTIL.chance(card, 'dd_enhancement_roll') and v.ability.set ~= 'Enhanced' then
          local enhancement = SMODS.poll_enhancement {
            key = 'dd_enhancement',
            guaranteed = true
          }

          G.E_MANAGER:add_event(Event {
            trigger = 'after',
            delay = 0.5,
            func = function()
              v:set_ability(enhancement)
              v:juice_up()
              card:juice_up()
              return true
            end
          })
        end

        if PB_UTIL.chance(card, 'dd_seal_roll') and not v.seal then
          local seal = SMODS.poll_seal {
            key = 'dd_seal',
            guaranteed = true
          }

          G.E_MANAGER:add_event(Event {
            trigger = 'after',
            delay = 0.5,
            func = function()
              v:set_seal(seal, nil, true)
              v:juice_up()
              card:juice_up()
              return true
            end
          })
        end

        if PB_UTIL.chance(card, 'dd_edition_roll') and not v.edition then
          local edition = poll_edition('dd_edition', nil, true, true)

          G.E_MANAGER:add_event(Event {
            trigger = 'after',
            delay = 0.5,
            func = function()
              v:set_edition(edition, true)
              v:juice_up()
              card:juice_up()
              return true
            end
          })
        end
      end

      card.ability.extra.hands_left = card.ability.extra.hands_left - 1

      if card.ability.extra.hands_left < 1 then
        PB_UTIL.destroy_joker(card)

        return {
          message = localize('paperback_consumed_ex'),
          colour = G.C.MULT
        }
      end
    end
  end
}
