SMODS.Joker {
  key = "time_regression_mix",
  config = {
    extra = {
      a_mult = 2,
      mult = 0,
      suits = 4
    }
  },
  attributes = {
    'mult',
    'scaling',
    'suit'
  },
  rarity = 1,
  pos = { x = 19, y = 10 },
  atlas = "jokers_atlas",
  cost = 3,
  unlocked = true,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = false,

  paperback_credit = {
    coder = { 'dowfrin' }
  },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.suits,
        card.ability.extra.a_mult,
        card.ability.extra.mult,
      }
    }
  end,

  calculate = function(self, card, context)
    if context.before and not context.blueprint then
      if PB_UTIL.get_unique_suits(context.scoring_hand, false, true) >= card.ability.extra.suits then
        SMODS.scale_card(card, {
          ref_table = card.ability.extra,
          ref_value = 'mult',
          scalar_value = 'a_mult',
          message_key = 'a_mult'
        })
        return nil, true
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
