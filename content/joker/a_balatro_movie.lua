SMODS.Joker {
  key = "a_balatro_movie",
  rarity = 2,
  pos = { x = 17, y = 2 },
  atlas = "jokers_atlas",
  config = {
    extra = {
      dollars = 3,
      last_hand = "None"
    }
  },
  cost = 5,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.dollars,
        card.ability.extra.last_hand
      }
    }
  end,

  calculate = function(self, card, context)
    if context.joker_main then
      local hand_played = G.GAME.last_hand_played
      if hand_played == card.ability.extra.last_hand then
        return {
          dollars = card.ability.extra.dollars
        }
      end
      card.ability.extra.last_hand = hand_played
    end
  end
}
