SMODS.Joker {
  key = "blue_marble",
  config = {
    extra = {
      suit = 'Clubs',
      planet = 'c_earth',
      ready = false
    }
  },
  rarity = 1,
  pos = { x = 11, y = 1 },
  atlas = "jokers_atlas",
  cost = 3,
  unlocked = true,
  discovered = true,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.extra.planet]

    return {
      vars = {
        localize(card.ability.extra.suit, 'suits_plural'),
        localize {
          type = 'name_text',
          set = 'Planet',
          key = card.ability.extra.planet
        },
        colours = {
          G.C.SUITS[card.ability.extra.suit]
        }
      }
    }
  end,

  calculate = function(self, card, context)
    if not context.blueprint and context.after and context.main_eval then
      card.ability.extra.ready = true

      for _, v in ipairs(context.full_hand) do
        if not v:is_suit(card.ability.extra.suit) then
          card.ability.extra.ready = false
          break
        end
      end
    end

    if context.end_of_round and context.main_eval and card.ability.extra.ready then
      card.ability.extra.ready = false

      if PB_UTIL.try_spawn_card { key = card.ability.extra.planet } then
        return {
          message = localize('k_plus_planet'),
          colour = G.C.SECONDARY_SET.Planet
        }
      end
    end
  end
}
