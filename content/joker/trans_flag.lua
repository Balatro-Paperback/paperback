SMODS.Joker {
  key = 'trans_flag',
  config = {
    extra = {
      a_mult = 5,
    }
  },
  rarity = 1,
  pos = { x = 22, y = 0 },
  atlas = 'jokers_atlas',
  cost = 6,
  unlocked = true,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,

  loc_vars = function(self, info_queue, card)
    local discards = 0
    if G.GAME then discards = G.GAME.current_round.discards_left end
    return {
      vars = {
        card.ability.extra.a_mult,
        discards * card.ability.extra.a_mult }
    }
  end,
  calculate = function(self, card, context)
    if context.joker_main then
      return {
        mult = G.GAME.current_round.discards_left * card.ability.extra.a_mult
      }
    end
  end,

  joker_display_def = function(JokerDisplay)
    return {
      text = {
        { text = "+" },
        { ref_table = "card.joker_display_values", ref_value = "mult", retrigger_type = "mult" }
      },
      text_config = { colour = G.C.MULT },
      calc_function = function(card)
        card.joker_display_values.mult = G.GAME.current_round.discards_left * card.ability.extra.a_mult
      end
    }
  end,
}
