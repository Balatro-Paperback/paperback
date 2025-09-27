SMODS.Joker {
  key = 'joker_cookie',
  config = {
    extra = {
      dollar_bonus = 1,
      dollar_gain = 2,
      odds = 5
    }
  },
  rarity = 1,
  pos = { x = 4, y = 5 },
  atlas = 'jokers_atlas',
  cost = 1,
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
        card.ability.extra.dollar_bonus,
        card.ability.extra.dollar_gain,
        numerator,
        denominator
      }
    }
  end,

  calculate = function(self, card, context)
    if not context.blueprint then
      if context.end_of_round and context.main_eval then
        -- Destroy the Joker if the odds are hit
        if PB_UTIL.chance(card, 'joker_cookie') then
          PB_UTIL.destroy_joker(card)

          -- Return the "Eaten!" message
          return {
            message = localize('k_eaten_ex')
          }
        else
          -- Return the "Safe!" message
          return {
            message = localize('k_safe_ex')
          }
        end
      end

      -- Upgrade the Joker when the user cashes out
      if context.paperback and context.paperback.cashing_out then
        card.ability.extra.dollar_bonus = card.ability.extra.dollar_bonus + card.ability.extra.dollar_gain

        return {
          message = localize('k_upgrade_ex'),
          colour = G.C.MONEY
        }
      end
    end
  end,

  -- Gives the money in the cash out screen
  calc_dollar_bonus = function(self, card)
    local dollar_bonus = card.ability.extra.dollar_bonus

    return dollar_bonus
  end
}
