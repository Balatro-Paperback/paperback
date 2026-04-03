SMODS.Joker {
  key = "double_dutchman",
  config = {
    extra = {
      odds = 4,
      hands_left = 5
    }
  },
  attributes = {
    'modify_card',
    'enhancements',
    'seals',
    'chance',
    'food'
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
  paperback_credit = {
    coder = { 'srockw' },
    artist = { 'scruby' }
  },

  loc_vars = function(self, info_queue, card)
    local numerator, denominator = PB_UTIL.chance_vars(card)
    local seal_den = denominator * 2

    return {
      vars = {
        numerator,
        denominator,
        seal_den,
        card.ability.extra.hands_left,
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

        if PB_UTIL.chance(card, 'dd_seal_roll', 1, card.ability.extra.odds * 2) and not v.seal then
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
      end

      card.ability.extra.hands_left = card.ability.extra.hands_left - 1

      if card.ability.extra.hands_left < 1 then
        PB_UTIL.destroy_joker(card)

        return {
          message = localize('paperback_consumed_ex'),
          colour = G.C.RED
        }
      end
    end
  end
}
