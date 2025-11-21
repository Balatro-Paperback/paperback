SMODS.Joker { -- Banana Man
  key = "banana_man",
  config = {
    extra = {
      xmult = 2,
      odds = 3,
    }
  },
  pos = {
    x = 1,
    y = 10
  },
  pools = {
    Music = true
  },
  cost = 8,
  rarity = 3,
  blueprint_compat = true,
  eternal_compat = true,
  unlocked = false,
  discovered = false,
  atlas = 'jokers_atlas',

  loc_vars = function(self, info_queue, card)
    local new_numerator, new_denominator = PB_UTIL.chance_vars(card, 'banana_man')
    return { vars = { new_numerator, new_denominator, card.ability.extra.xmult } }
  end,

  calculate = function(self, card, context)
    if context.other_joker and context.other_joker.ability.set == "Joker" then -- this is just baseball card's code, dont @ me
      if PB_UTIL.chance(card, 'potassium') then
        return {
          x_mult = card.ability.extra.xmult,
          message_card = context.other_joker
        }
      end
    end
  end,

  check_for_unlock = function(self, args)
    if args.type == 'modify_jokers' and G.jokers then
      if next(SMODS.find_card('j_cavendish')) then
        return true
      end
      return false
    end
  end,

  joker_display_def = function(JokerDisplay)
    return {
      text = {
        { ref_table = "card.joker_display_values", ref_value = "count", retrigger_type = "mult" },
        { text = "x", scale = 0.35 },
        {
          border_nodes = {
            { text = "X" },
            { ref_table = "card.ability.extra", ref_value = "xmult" }
          }
        },
      },
      extra = {
        {
          { text = '(' },
          { ref_table = 'card.joker_display_values', ref_value = 'odds' },
          { text = ')' },
        },
      },
      extra_config = {
        colour = G.C.GREEN,
        scale = 0.3,
      },
      calc_function = function(card)
        card.joker_display_values.count = G.jokers and #G.jokers.cards or 0
        card.joker_display_values.odds = localize { type = 'variable', key = "jdis_odds", vars = { PB_UTIL.chance_vars(card, 'banana_man') } }
      end
    }
  end,
}
