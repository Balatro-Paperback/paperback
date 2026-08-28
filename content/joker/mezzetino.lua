SMODS.Joker {
  key = "mezzetino",
  config = {
    extra = {
      dollars = 2
    }
  },
  attributes = {
    'red',
    'economy',
    'destroy_cards',
    'discard'
  },
  rarity = 2,
  pos = { x = 19, y = 9 },
  atlas = "jokers_atlas",
  cost = 7,
  blueprint_compat = false,
  eternal_compat = true,
  perishable_compat = true,
  paperback = {

  },
  paperback_credit = {
    coder = { 'thermo' }
  },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.dollars
      }
    }
  end,

  calculate = function(self, card, context)
    if context.end_of_round and not context.blueprint then
      if context.main_eval then
        local hand = {}
        for i, v in ipairs(G.hand.cards) do
          table.insert(hand, i)
        end
        local discards = math.min(G.GAME.current_round.discards_left, #G.hand.cards)
        while discards > 0 do
          local c = pseudorandom_element(hand, "mezzetino")
          if not G.hand.cards[c].ability.paperback_mezzetino_mark then
            G.hand.cards[c].ability.paperback_mezzetino_mark = true
            table.remove(hand, c)
            discards = discards - 1
          end
        end
      end
      if context.individual and context.cardarea == G.hand then
        if context.other_card.ability.paperback_mezzetino_mark then
          context.other_card.ability.paperback_mezzetino_mark = nil
          ease_discard(-1, false, false)
          SMODS.destroy_cards({ context.other_card })
          return {
            dollars = card.ability.extra.dollars,
          }
        end
      end
    end
  end
}
