SMODS.Joker {
  key = 'a_balatro_movie',
  unlocked = true,
  discovered = false,
  config = {
    extra = {
      last_hand_played = 'None',
      dollars = 3
    }
  },
  atlas = "jokers_atlas",
  rarity = 1,
  blueprint_compat = false,
  eternal_compat = true,
  perishable_compat = true,
  cost = 4,
  pos = { x = 17, y = 2 },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.last_hand_played, card.ability.extra.dollars } }
  end,
  calculate = function(self, card, context)
    if context.joker_main then
      if card.ability.extra.last_hand_played == G.GAME.last_hand_played then
        return { dollars = card.ability.extra.dollars }
      end
    end
    if context.final_scoring_step then
      card.ability.extra.last_hand_played = G.GAME.last_hand_played
    end
  end
}
