SMODS.Joker {
  key = "roulette",
  config = {
    extra = {
      money_for_suit = 1,
      money_for_rank = 5,
      money_for_both = 50,
    }
  },
  rarity = 2,
  pos = { x = 11, y = 10 },
  atlas = "jokers_atlas",
  cost = 7,
  unlocked = true,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        localize(card.ability.extra.rank, 'ranks'),
        localize(card.ability.extra.suit, 'suits_plural'),
        card.ability.extra.money_for_suit,
        card.ability.extra.money_for_rank,
        card.ability.extra.money_for_both,
        colours = {
          G.C.SUITS[card.ability.extra.suit]
        }
      }
    }
  end,

  set_ability = function(self, card, initial, delay_sprites)
    -- this spin's just for fun!
    card.ability.extra.suit = pseudorandom_element(PB_UTIL.base_suits, pseudoseed('roulette_suit'))
    card.ability.extra.rank = pseudorandom_element(PB_UTIL.base_ranks, pseudoseed('roulette_rank'))
  end,

  calculate = function(self, card, context)
    if context.before and not context.blueprint then
      card.ability.extra.suit = pseudorandom_element(PB_UTIL.base_suits, pseudoseed('roulette_suit'))
      card.ability.extra.rank = pseudorandom_element(PB_UTIL.base_ranks, pseudoseed('roulette_rank'))
    end
    if context.individual and context.cardarea == G.play then
      local c = context.other_card
      if c then
        local suit_match = c:is_suit(card.ability.extra.suit)
        local rank_match = PB_UTIL.is_rank(c, card.ability.extra.rank)
        if suit_match and rank_match then
          return {
            dollars = card.ability.extra.money_for_both,
            message_card = c,
            juice_card = context.blueprint_card or card
          }
        elseif suit_match then
          return {
            dollars = card.ability.extra.money_for_suit,
            message_card = c,
            juice_card = context.blueprint_card or card
          }
        elseif rank_match then
          return {
            dollars = card.ability.extra.money_for_rank,
            message_card = c,
            juice_card = context.blueprint_card or card
          }
        end
      end
    end
  end
}