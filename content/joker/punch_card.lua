SMODS.Joker {
  key = "punch_card",
  config = {
    extra = {
      current_rounds = 0,
      total_rounds = 3,
      antes = -1
    }
  },
  rarity = 3,
  pos = { x = 15, y = 3 },
  atlas = "jokers_atlas",
  cost = 10,
  blueprint_compat = false,
  eternal_compat = false,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.total_rounds, card.ability.extra.current_rounds, card.ability.extra.antes
      }
    }
  end,

  calculate = function(self, card, context)
    if context.selling_self and (card.ability.extra.current_rounds >= card.ability.extra.total_rounds) and not context.blueprint then
      ease_ante(card.ability.extra.antes)
      return { message = localize('paperback_punch_card_ex'), colour = G.C.RED }
    end

    if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
      card.ability.extra.current_rounds = card.ability.extra.current_rounds + 1
      if card.ability.extra.current_rounds == card.ability.extra.total_rounds then
        local eval = function(card) return not card.REMOVED end
        juice_card_until(card, eval, true)
      end
      return {
        message = (card.ability.extra.current_rounds < card.ability.extra.total_rounds) and
            (card.ability.extra.current_rounds .. '/' .. card.ability.extra.total_rounds) or
            localize('paperback_punch_card_active'),
        colour = G.C.BLUE
      }
    end
  end
}
