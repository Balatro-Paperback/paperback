SMODS.Joker {
  key = 'pyrite',
  config = {
    extra = {
      suit = 'paperback_Crowns',
      odds = 3
    }
  },
  rarity = 2,
  pos = { x = 2, y = 9 },
  atlas = 'jokers_atlas',
  cost = 7,
  unlocked = true,
  discovered = true,
  blueprint_compat = true,
  eternal_compat = true,
  paperback = {
    requires_crowns = true
  },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        localize(card.ability.extra.suit, 'suits_plural'),
        G.GAME.probabilities.normal,
        card.ability.extra.odds,
        colours = {
          G.C.SUITS[card.ability.extra.suit] or G.C.PAPERBACK_CROWNS_LC
        }
      }
    }
  end,

  calculate = function(self, card, context)
    if context.individual and (context.cardarea == G.play or context.cardarea == 'unscored') then
      if context.other_card:is_suit(card.ability.extra.suit) then
        if pseudorandom("pyrite") < G.GAME.probabilities.normal / card.ability.extra.odds then
          local eff_card = context.blueprint_card or card

          return nil, PB_UTIL.try_spawn_card {
            set = 'Tarot',
            func = function()
              SMODS.calculate_effect({
                message = localize('k_plus_tarot'),
                colour = G.C.SECONDARY_SET.Tarot,
                juice_card = eff_card,
                message_card = context.other_card
              }, eff_card)
            end
          }
        end
      end
    end
  end
}
