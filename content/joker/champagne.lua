SMODS.Joker {
  key = 'champagne',
  config = {
    extra = {
      money = 1,
      a_money = 1,
      rounds_left = 3
    }
  },
  rarity = 1,
  pos = { x = 2, y = 8 },
  atlas = 'jokers_atlas',
  cost = 5,
  unlocked = true,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = false,
  pools = {
    Food = true
  },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.money,
        card.ability.extra.rounds_left
      }
    }
  end,

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play and G.GAME.blind.boss then
      return {
        dollars = card.ability.extra.money *
            (context.other_card.seal and (card.ability.extra.a_money * 2) or card.ability.extra.a_money),
        card = card
      }
    end

    if not context.blueprint and context.end_of_round and context.main_eval then
      card.ability.extra.rounds_left = card.ability.extra.rounds_left - 1

      if card.ability.extra.rounds_left <= 0 then
        PB_UTIL.destroy_joker(card)

        return {
          message = localize('paperback_destroyed_ex')
        }
      end

      return {
        message = localize {
          type = 'variable',
          key = 'paperback_a_round_minus',
          vars = { 1 }
        }
      }
    end
  end,

  joker_display_def = function(JokerDisplay)
    return {
      text = {
        { text = '+$',                             colour = G.C.MONEY },
        { ref_table = 'card.joker_display_values', ref_value = 'money', colour = G.C.MONEY },
      },

      extra = {
        {
          { text = '(',                        colour = G.C.UI.TEXT_INACTIVE },
          { ref_table = 'card.ability.extra.', ref_value = 'rounds_left',    colour = G.C.IMPORTANT },
          { text = ')',                        colour = G.C.UI.TEXT_INACTIVE },
        }
      },
      extra_config = {
        scale = 0.3,
      },

      reminder_text = {
        { ref_table = 'card.joker_display_values', ref_value = 'active' },
      },

      calc_function = function(card)
        local text, _, scoring_hand = JokerDisplay.evaluate_hand()
        local money = 0

        if G.GAME.blind.boss then
          for k, v in pairs(scoring_hand) do
            local triggers = JokerDisplay.calculate_card_triggers(v, scoring_hand)

            for i = 1, triggers do
              money = money + (v.seal and (card.ability.extra.a_money * 2) or card.ability.extra.a_money)
            end
          end
        end

        card.joker_display_values.money = money
        card.joker_display_values.active = G.GAME.blind.boss and localize('k_active') or localize('paperback_inactive')
      end,

      style_function = function(card, text, reminder_text, extra)
        if reminder_text and reminder_text.children[1] then
          reminder_text.children[1].config.colour = card.joker_display_values.active == localize('k_active') and
              G.C.GREEN or G.C.UI.TEXT_INACTIVE
        end
      end
    }
  end
}
