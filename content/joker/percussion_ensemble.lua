SMODS.Joker {
  key = "percussion_ensemble",
  config = {
    extra = {
      xMult = 1,
      xMult_mod = .25
    }
  },
  attributes = {
    'xmult',
    'enhancements',
    'full_deck'
  },
  rarity = 2,
  pos = { x = 16, y = 5 },
  atlas = "jokers_atlas",
  cost = 7,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,

  paperback_credit = {
    coder = { 'infinityplus' }
  },
  unlocked = false,

  loc_vars = function(self, info_queue, card)
    local unique_specials = PB_UTIL.special_cards_in_deck(true, false) or 0

    return {
      vars = {
        card.ability.extra.xMult_mod,
        card.ability.extra.xMult_mod * unique_specials + card.ability.extra.xMult
      }
    }
  end,

  check_for_unlock = function(self, args)
    local steel_in_deck = false
    local glass_in_deck = false
    local gold_in_deck = false
    for _, v in ipairs(G.playing_cards or {}) do
      if SMODS.has_enhancement(v, 'm_steel') then
        steel_in_deck = true
      end
      if SMODS.has_enhancement(v, 'm_glass') then
        glass_in_deck = true
      end
      if SMODS.has_enhancement(v, 'm_gold') then
        gold_in_deck = true
      end
    end
    return steel_in_deck and glass_in_deck and gold_in_deck
  end,

  locked_loc_vars = function(self, info_queue, card)
    return { vars = { localize { type = 'name_text', key = 'm_steel', set = 'Enhanced' },
                      localize { type = 'name_text', key = 'm_glass', set = 'Enhanced' },
                      localize { type = 'name_text', key = 'm_gold', set = 'Enhanced' } } }
  end,

  calculate = function(self, card, context)
    if context.joker_main then
      if PB_UTIL.special_cards_in_deck(true, false) >= 1 then
        return {
          x_mult = card.ability.extra.xMult + card.ability.extra.xMult_mod * PB_UTIL.special_cards_in_deck(true, false)
        }
      end
    end
  end,

  joker_display_def = function(JokerDisplay)
    return {
      text = {
        {
          border_nodes = {
            { text = "X" },
            { ref_table = "card.joker_display_values", ref_value = "x_mult", retrigger_type = "exp" }
          }
        }
      },
      calc_function = function(card)
        local unique_specials = PB_UTIL.special_cards_in_deck(true, false) or 0
        card.joker_display_values.x_mult = card.ability.extra.xMult_mod * unique_specials + card.ability.extra.xMult
      end
    }
  end,
}
