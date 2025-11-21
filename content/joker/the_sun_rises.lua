SMODS.Joker {
  key = 'the_sun_rises',
  config = {
    extra = {
      set_base_chips = 1,
      chips = 0,
      chip_inc_per_light = 1,
    }
  },
  rarity = 3,
  pos = { x = 22, y = 1 },
  atlas = 'jokers_atlas',
  cost = 8,
  unlocked = true,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = false,

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = PB_UTIL.suit_tooltip('light')

    return {
      vars = {
        card.ability.extra.set_base_chips,
        card.ability.extra.chips,
        card.ability.extra.chip_inc_per_light,
      }
    }
  end,

  calculate = function(self, card, context)
    if context.modify_hand then
      hand_chips = card.ability.extra.set_base_chips
      update_hand_text({ sound = 'chips2', modded = true }, { chips = hand_chips, mult = mult })
      return
    end

    if context.individual and context.cardarea == G.play
    and PB_UTIL.is_suit(context.other_card, 'light') then
      local chips = card.ability.extra.chips
      if not context.blueprint then
        card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chip_inc_per_light
      end
      return {
        chips = chips
      }
    end
  end,

  joker_display_def = function(JokerDisplay)
    return {
      text = {
        { text = "=" },
        { ref_table = "card.ability.extra", ref_value = "set_base_chips" },
        { text = " +" },
        { ref_table = "card.joker_display_values", ref_value = "chips" }
      },
      text_config = { colour = G.C.CHIPS },
      reminder_text = {
        { text = "(" },
        {
          text = localize('paperback_light'),
          colour = lighten(G.C.PAPERBACK_LIGHT_SUIT, 0.35)
        },
        { text = ")" },
      },
      calc_function = function(card)
        local count = 0
        local _, _, scoring_hand = JokerDisplay.evaluate_hand()
        for _, scoring_card in pairs(scoring_hand) do
          if PB_UTIL.is_suit(scoring_card, 'light') then
            count = count +
                JokerDisplay.calculate_card_triggers(scoring_card, scoring_hand)
          end
        end
        count = count * JokerDisplay.calculate_joker_triggers(card)

        card.joker_display_values.chips =
            count * card.ability.extra.chips
            + count * (count - 1) / 2 * card.ability.extra.chip_inc_per_light
      end
    }
  end,
}
