SMODS.Joker {
  key = "joke_master",
  config = {
    extra = {
      mult = 0,
      a_mult = 2,
    }
  },
  rarity = 1,
  pos = { x = 15, y = 2 },
  atlas = "jokers_atlas",
  cost = 3,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = false,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.a_mult,
        localize(G.GAME.paperback.joke_master_hand, 'poker_hands'),
        card.ability.extra.mult
      }
    }
  end,

  calculate = function(self, card, context)
    if not context.blueprint and context.before and context.main_eval then
      -- Check that scoring hand is exactly the one needed
      if context.scoring_name == G.GAME.paperback.joke_master_hand then
        card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.a_mult

        return {
          message = localize {
            type = 'variable',
            key = 'a_mult',
            vars = { card.ability.extra.mult }
          },
          colour = G.C.MULT
        }
      end
    end

    if context.joker_main then
      return {
        mult = card.ability.extra.mult
      }
    end
  end,

  joker_display_def = function(JokerDisplay)
    return {
      text = {
        { text = "+" },
        { ref_table = "card.ability.extra", ref_value = "mult", retrigger_type = "mult" }
      },
      text_config = { colour = G.C.MULT },
      reminder_text = {
        { text = "(" },
        { ref_table = "card.joker_display_values", ref_value = "joke_master_hand", colour = G.C.ORANGE },
        { text = ")" },
      },
      calc_function = function(card)
        card.joker_display_values.joke_master_hand =
            localize(G.GAME.paperback.joke_master_hand, 'poker_hands')
      end
    }
  end,
}
