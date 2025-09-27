SMODS.Joker {
  key = "boundary_of_death",
  config = {
    extra = {
      odds = 4,
      mult = 46
    }
  },
  rarity = 2,
  pos = { x = 11, y = 2 },
  atlas = "jokers_atlas",
  cost = 8,
  blueprint_compat = false,
  eternal_compat = true,
  perishable_compat = true,
  enhancement_gate = 'm_mult',

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.m_mult
    local numerator, denominator = PB_UTIL.chance_vars(card)

    return {
      vars = {
        localize {
          type = 'name_text',
          set = 'Enhanced',
          key = 'm_mult'
        },
        numerator,
        denominator,
        card.ability.extra.mult
      }
    }
  end,

  joker_display_def = function(JokerDisplay)
    return {
      reminder_text = {
        { text = "(" },
        {
          ref_table = "card.joker_display_values",
          ref_value = "enhancement",
          colour = G.C.MULT
        },
        { text = ")", colour = G.C.UI.TEXT_INACTIVE },
      },

      extra = {
        {
          { text = "(" },
          { ref_table = 'card.joker_display_values', ref_value = 'odds' },
          { text = ")" }
        },
      },

      extra_config = {
        colour = G.C.GREEN,
        scale = 0.3
      },

      calc_function = function(card)
        card.joker_display_values.odds = localize {
          type = 'variable',
          key = 'jdis_odds',
          vars = { PB_UTIL.chance_vars(card) }
        }

        card.joker_display_values.enhancement = localize {
          type = 'name_text',
          set = 'Enhanced',
          key = 'm_mult'
        }
      end
    }
  end
}

local get_chip_mult_ref = Card.get_chip_mult
function Card.get_chip_mult(self)
  local amt = get_chip_mult_ref(self)

  if SMODS.has_enhancement(self, 'm_mult') then
    local _, joker = next(SMODS.find_card('j_paperback_boundary_of_death', false))

    if joker and PB_UTIL.chance(joker, 'boundary_of_death') then
      amt = amt + joker.ability.extra.mult
    end
  end

  return amt
end
