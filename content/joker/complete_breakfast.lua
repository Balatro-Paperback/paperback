SMODS.Joker {
  key = 'complete_breakfast',
  config = {
    extra = {
      mult = 5,
      chips = 50,
      odds = 8,
      chance_multiplier = 1
    }
  },
  rarity = 1,
  pos = { x = 6, y = 5 },
  atlas = 'jokers_atlas',
  cost = 4,
  blueprint_compat = true,
  eternal_compat = false,
  pools = {
    Food = true
  },
  unlocked = false,
  check_for_unlock = function(self, args)
    if args.type == 'modify_jokers' and G.jokers then
      local count = 0
      for _, joker in ipairs(G.jokers.cards) do
        if joker.ability.set == 'Joker' and PB_UTIL.is_food(joker) then
          count = count + 1
        end
      end
      return count >= 3
    end
  end,
  locked_loc_vars = function(self, info_queue, center)
    return {
      vars = { 3 }
    }
  end,

  loc_vars = function(self, info_queue, card)
    local numerator, denominator = PB_UTIL.chance_vars(card, nil, card.ability.extra.chance_multiplier)

    return {
      vars = {
        card.ability.extra.mult,
        card.ability.extra.chips,
        numerator,
        denominator,
        numerator / card.ability.extra.chance_multiplier
      }
    }
  end,

  calculate = function(self, card, context)
    if context.cardarea ~= G.jokers then return end

    -- Give mult and chips when evaluating joker
    if context.joker_main then
      return {
        mult = card.ability.extra.mult,
        chips = card.ability.extra.chips
      }
    end

    -- Check if Joker needs to be eaten, and if not, increase the chance it will be eaten next time
    if context.after and not context.blueprint then
      if PB_UTIL.chance(card, 'complete_breakfast', card.ability.extra.chance_multiplier) then
        PB_UTIL.destroy_joker(card)

        return {
          message = localize('k_eaten_ex'),
          colour = G.C.MULT
        }
      else
        card.ability.extra.chance_multiplier = card.ability.extra.chance_multiplier + 1

        return {
          message = localize('k_safe_ex'),
          colour = G.C.CHIPS,
        }
      end
    end
  end,

  joker_display_def = function(JokerDisplay)
    return {
      text = {
        { text = '+', colour = G.C.MULT },
        { ref_table = 'card.ability.extra', ref_value = 'mult', colour = G.C.MULT },
        { text = ' +', colour = G.C.CHIPS },
        { ref_table = 'card.ability.extra', ref_value = 'chips', colour = G.C.CHIPS },
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
