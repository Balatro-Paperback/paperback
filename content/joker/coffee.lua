SMODS.Joker {
  key = "coffee",
  config = {
    extra = {
      hand_size = 0,
      increase = 1,
      odds = 5
    }
  },
  rarity = 2,
  pos = { x = 3, y = 6 },
  atlas = 'jokers_atlas',
  cost = 6,
  unlocked = true,
  discovered = false,
  blueprint_compat = false,
  eternal_compat = false,
  soul_pos = nil,
  pools = {
    Food = true
  },

  loc_vars = function(self, info_queue, card)
    local numerator, denominator = PB_UTIL.chance_vars(card)

    return {
      vars = {
        card.ability.extra.hand_size,
        card.ability.extra.increase,
        numerator,
        denominator
      }
    }
  end,

  calculate = function(self, card, context)
    if context.blueprint then return end

    if context.skip_blind then
      -- Increment the hand size when skipping a blind
      card.ability.extra.hand_size = card.ability.extra.hand_size + card.ability.extra.increase
      G.hand:change_size(card.ability.extra.increase)

      return {
        message = localize('k_upgrade_ex')
      }
    end

    if context.setting_blind and not context.blind.boss then
      if PB_UTIL.chance(card, 'coffee') then
        PB_UTIL.destroy_joker(card)

        -- Revert all the hand size increase when eaten
        G.hand:change_size(-card.ability.extra.hand_size)

        return {
          message = localize('paperback_consumed_ex'),
          colour = G.C.MULT
        }
      end
    end
  end,

  joker_display_def = function(JokerDisplay)
    return {
      text = {
        { text = '+' },
        { ref_table = 'card.ability.extra', ref_value = 'hand_size' },
      },
      text_config = {
        colour = G.C.IMPORTANT
      },

      extra = {
        {
          { text = '(' },
          { ref_table = 'card.joker_display_values', ref_value = 'odds' },
          { text = ')' },
        }
      },
      extra_config = {
        colour = G.C.GREEN,
        scale = 0.3,
      },

      calc_function = function(card)
        card.joker_display_values.odds = localize { type = 'variable', key = 'jdis_odds', vars = { PB_UTIL.chance_vars(card) } }
      end
    }
  end
}
