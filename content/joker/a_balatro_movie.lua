SMODS.Joker {
  key = 'a_balatro_movie',
  unlocked = true,
  discovered = false,
  config = {
    extra = {
      dollars = 2
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
    return {
      vars = {
        card.ability.extra.last_hand_played and localize(card.ability.extra.last_hand_played, 'poker_hands') or 'None',
        card.ability.extra.dollars
      }
    }
  end,
  set_ability = function(self, card, initial, delay_sprites)
    card.ability.extra.last_hand_played = G.GAME.last_hand_played
  end,
  calculate = function(self, card, context)
    if context.joker_main then
      if card.ability.extra.last_hand_played == G.GAME.last_hand_played then
        return { dollars = card.ability.extra.dollars }
      end
    end
    if context.after then
      card.ability.extra.last_hand_played = G.GAME.last_hand_played
    end
  end,
  joker_display_def = function(JokerDisplay)
    return {
      text = {
        { text = "+$" },
        { ref_table = "card.joker_display_values", ref_value = "dollars", retrigger_type = "mult" },
      },
      text_config = { colour = G.C.GOLD },
      reminder_text = {
        { text = "(" },
        { ref_table = "card.joker_display_values", ref_value = "last_hand_played", colour = G.C.ORANGE },
        { text = ")" },
      },
      calc_function = function(card)
        local text, _, _ = JokerDisplay.evaluate_hand()
        local is_last = text == card.ability.extra.last_hand_played
        card.joker_display_values.dollars = is_last and card.ability.extra.dollars or 0
        card.joker_display_values.last_hand_played = card.ability.extra.last_hand_played and
        localize(card.ability.extra.last_hand_played, 'poker_hands') or 'None'
      end
    }
  end,
}
