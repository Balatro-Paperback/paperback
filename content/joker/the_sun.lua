SMODS.Joker {
  key = "the_sun",
  config = {
    extra = {
      a_mult = 2,
      mult = 0,
    }
  },
  rarity = 1,
  pos = { x = 16, y = 7 },
  atlas = "jokers_atlas",
  cost = 3,
  unlocked = true,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = false,

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = PB_UTIL.suit_tooltip('light')

    return {
      vars = {
        card.ability.extra.a_mult,
        card.ability.extra.mult,
      }
    }
  end,

  calculate = function(self, card, context)
    if context.before and not context.blueprint then
      local bad_suit = false
      -- Check for no scoring dark suit
      for _, v in ipairs(context.scoring_hand) do
        bad_suit = bad_suit or PB_UTIL.is_non_suit(v, 'light')
      end
      if not bad_suit then
        card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.a_mult
        return {
          message = localize {
            type = 'variable',
            key = 'a_mult',
            vars = { card.ability.extra.a_mult }
          },
          colour = G.C.FILTER
        }
      end
    end

    if context.individual and context.cardarea == G.play and not context.blueprint then
      if card.ability.extra.mult > 0 then
        if PB_UTIL.is_non_suit(context.other_card, 'light') then
          card.ability.extra.mult = card.ability.extra.mult - card.ability.extra.a_mult
          return {
            message = localize {
              type = 'variable',
              key = 'a_mult_minus',
              vars = { card.ability.extra.a_mult },
              colour = G.C.MULT
            }
          }
        end
      end
    end

    if context.joker_main then
      return {
        mult = card.ability.extra.mult
      }
    end
  end,

  joker_display_def = function(JokerDisplay)
    return {
      text = {
        { text = "+" },
        { ref_table = "card.ability.extra", ref_value = "mult", retrigger_type = "mult" }
      },
      text_config = { colour = G.C.MULT },
    }
  end,
}
