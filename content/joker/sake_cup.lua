SMODS.Joker {
  key = 'sake_cup',
  config = {
    extra = {
      odds = 2,
      rank = "9",
    }
  },
  rarity = 3,
  pos = { x = 6, y = 9 },
  atlas = 'jokers_atlas',
  cost = 8,
  unlocked = false,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,

  loc_vars = function(self, info_queue, card)
    local numerator, denominator = PB_UTIL.chance_vars(card)

    return {
      vars = {
        localize(card.ability.extra.rank, 'ranks'),
        numerator,
        denominator
      }
    }
  end,
  locked_loc_vars = function(self, info_queue, center)
    return {
      vars = { 9 }
    }
  end,
  check_for_unlock = function(self, args)
    if args.type == 'upgrade_hand' then
      return args.level >= 9
    end
  end,

  -- Calculate function for the Joker
  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.hand and not context.end_of_round
    and PB_UTIL.is_rank(context.other_card, card.ability.extra.rank) then
      if not context.other_card.debuff and PB_UTIL.chance(card, 'sake_cup') then
        local planet = PB_UTIL.get_planet_for_hand(context.scoring_name)
        local eff_card = context.blueprint_card or card

        if planet and PB_UTIL.can_spawn_card(G.consumeables, true) then
          return {
            message = localize('k_plus_planet'),
            colour = G.C.SECONDARY_SET.Planet,
            message_card = eff_card,
            juice_card = context.other_card,
            func = function()
              G.E_MANAGER:add_event(Event {
                func = function()
                  SMODS.add_card { key = planet }
                  G.GAME.consumeable_buffer = 0
                  return true
                end
              })
            end
          }
        end
      end
    end
  end,

  joker_display_def = function(JokerDisplay)
    return {
      text = {
        { text = "+" },
        { ref_table = "card.joker_display_values", ref_value = "count", retrigger_type = "mult" },
      },
      text_config = { colour = G.C.SECONDARY_SET.Planet },
      extra = {
        {
          { text = "(" },
          { ref_table = "card.joker_display_values", ref_value = "odds" },
          { text = ")" },
        }
      },
      extra_config = { colour = G.C.GREEN, scale = 0.3 },
      calc_function = function(card)
        local count = 0
        -- Taken from JokerDisplay's Shoot The Moon
        for _, playing_card in ipairs(G.hand.cards) do
          if not playing_card.highlighted then
            if playing_card.facing and not (playing_card.facing == 'back')
            and not playing_card.debuff
            and PB_UTIL.is_rank(playing_card, card.ability.extra.rank) then
              count = count + JokerDisplay.calculate_card_triggers(playing_card, nil, true)
            end
          end
        end
        card.joker_display_values.count = count
        card.joker_display_values.odds = localize { type = 'variable', key = "jdis_odds", vars = { PB_UTIL.chance_vars(card) } }
      end
    }
  end,
}
