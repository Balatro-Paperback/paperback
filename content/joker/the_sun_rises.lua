SMODS.Joker {
  key = 'the_sun_rises',
  config = {
    extra = {
      set_base_chips = 1,
      chips = 0,
      chip_inc_per_light = 1,
    }
  },
  attributes = {
    'chips',
    'scaling',
    'suit',
    'light',
    'red'
  },
  rarity = 3,
  pos = { x = 22, y = 1 },
  atlas = 'jokers_atlas',
  cost = 8,
  unlocked = false,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = false,

  paperback_credit = {
    artist = { 'dylan_hall' },
    coder = { 'ejwu' }
  },

  check_for_unlock = function (self, args)
    if G.GAME.consumeable_usage then
      if G.GAME.consumeable_usage.c_sun and G.GAME.consumeable_usage.c_sun.count >= 3 then
        return true
      end
    end
  end,

  locked_loc_vars = function (self, info_queue, card)
    return { vars = { 3 }}
  end,

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
      SMODS.Scoring_Parameters.chips.current = card.ability.extra.set_base_chips
      update_hand_text(
        { sound = 'chips2', modded = true },
        { chips = card.ability.extra.set_base_chips }
      )
    end

    if context.individual and context.cardarea == G.play and context.other_card:is_suit_shade('light') then
      if not context.blueprint then
        SMODS.scale_card(card, {
          ref_table = card.ability.extra,
          ref_value = 'chips',
          scalar_value = 'chip_inc_per_light',
          no_message = true
        })
      end

      return {
        chips = card.ability.extra.chips
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
          if scoring_card:is_suit_shade('light') then
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
