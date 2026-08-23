SMODS.Joker {
  key = "superjoker",
  config = {
    extra = {
      x_mult = 0.5,
      super = false
    }
  },
  attributes = {
    'retrigger',
    'red'
  },
  rarity = 2,
  pos = { x = 3, y = 12 },
  atlas = 'jokers_atlas',
  cost = 5,
  unlocked = false,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,
  paperback_credit = {
    coder = { 'dowfrin' },
  },

  check_for_unlock = function (self, args)
    return (G.GAME.paperback.destroyed_cards.suits["light"] or 0) >= 1
  end,
    

  loc_vars = function(self, info_queue, card)
    return {
      vars = { card.ability.extra.x_mult }
    }
  end,

  calculate = function(self, card, context)
    if G.GAME.current_round.hands_played == 0 then
      if context.repetition and not context.individual then
        card.ability.extra.super = not card.ability.extra.super
        return {
          repetitions = 1,
          message =  localize("paperback_superhot_" .. tostring(card.ability.extra.super)),
          color = G.C.MULT
        }
      end
    end


    if context.joker_main and G.GAME.current_round.hands_played > 0 then
      return {
        x_mult = card.ability.extra.x_mult,
      }
    end
  end,

  joker_display_def = function(JokerDisplay)
    return {
      text = {
        {
          border_nodes = {
            { text = "X" },
            { ref_table = "card.ability.extra", ref_value = "x_mult", retrigger_type = "exp" }
          }
        }
      },
    }
  end,
}
