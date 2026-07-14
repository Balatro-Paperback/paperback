SMODS.Joker {
  key = "ponzu",
  config = {
    extra = {
      odds = 2,
      dollars = 2,
      active = false
    }
  },
  attributes = {
    'economy',
    'suit',
    'food',
    'chance'
  },
  rarity = 1,
  pos = { x = 18, y = 12 },
  atlas = "jokers_atlas",
  cost = 6,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,
  paperback = {

  },
  paperback_credit = {
    coder = { 'thermo' }
  },

  loc_vars = function(self, info_queue, card)
    local numerator, denominator = PB_UTIL.chance_vars(card)
    local suit = G.GAME.paperback.ponzu_suit or "Spades"
    return {
      vars = {
        numerator,
        denominator,
        card.ability.extra.dollars,
        localize(
          suit,
          'suits_plural'),
        colours = { G.C.SUITS[suit] }
      }
    }
  end,

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.hand and not context.end_of_round
    and context.other_card:is_suit(G.GAME.paperback.ponzu_suit) then
      if not context.other_card.debuff and PB_UTIL.chance(card, 'ponzu') then
        card.ability.extra.active = true
        return {
          dollars = 2
        }
      end
    end
    if context.end_of_round and context.main_eval and not card.ability.extra.active then
      PB_UTIL.destroy_joker(card)
      return {
        message = localize('paperback_consumed_ex'),
        colour = G.C.MULT
      }
    end
  end
}
