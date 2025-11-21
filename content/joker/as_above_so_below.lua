SMODS.Joker {
  key = "as_above_so_below",
  rarity = 2,
  pos = { x = 16, y = 4 },
  atlas = "jokers_atlas",
  cost = 6,
  unlocked = false,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,
  paperback = {
    requires_ranks = true
  },

  in_pool = function(self, args)
    for _, v in ipairs(G.playing_cards or {}) do
      if PB_UTIL.is_rank(v, 'paperback_Apostle') then
        return true
      end
    end
  end,

  check_for_unlock = function(self, args)
    if args.type == 'hand' then
      if args.handname == 'Straight Flush' then
        -- if hand contains Straight Flush and an Apostle, it is a rapture
        for _, card in pairs(args.scoring_hand) do
          if PB_UTIL.is_rank(card, 'paperback_Apostle') then
            return true
          end
        end
      end
    end
  end,

  calculate = function(self, card, context)
    if context.before and #context.scoring_hand >= 5 then
      local apostle = false
      -- Check for apostle
      for _, v in ipairs(context.scoring_hand) do
        if PB_UTIL.is_rank(v, 'paperback_Apostle') then
          apostle = true
          break
        end
      end
      if apostle then
        if not next(context.poker_hands["Straight"]) then
          if PB_UTIL.try_spawn_card { set = 'Tarot' } then
            return {
              message = localize('k_plus_tarot'),
              colour = G.C.SECONDARY_SET.Tarot
            }
          end
        else
          if PB_UTIL.try_spawn_card { set = 'Spectral' } then
            return {
              message = localize('k_plus_spectral'),
              colour = G.C.SECONDARY_SET.Spectral
            }
          end
        end
      end
    end
  end,
  joker_display_def = function (JokerDisplay)
    return {
      text = {
        { text = "+" },
        { ref_table = "card.joker_display_values", ref_value = "count", retrigger_type = "mult" },
      },
      text_config = { colour = G.C.SECONDARY_SET.Tarot },
      calc_function = function(card)
        local _, poker_hands, scoring_hand = JokerDisplay.evaluate_hand()
        local card_type_given = nil
        if #scoring_hand >= 5 then
          local apostle = false
          -- Check for apostle
          for _, v in ipairs(scoring_hand) do
            if PB_UTIL.is_rank(v, 'paperback_Apostle') then
              apostle = true
              break
            end
          end
          if apostle then
            if not next(poker_hands["Straight"]) then
              card_type_given = "Tarot"
            else
              card_type_given = "Spectral"
            end
          end
        end
        card.joker_display_values.card_type_given = card_type_given
        card.joker_display_values.count = card_type_given and 1 or 0
      end,
      style_function = function(card, text, reminder_text, extra)
        if text then
          for _, child in ipairs(text.children) do
            child.config.colour = card.joker_display_values.card_type_given == 'Spectral' and G.C.SECONDARY_SET.Spectral or
              G.C.SECONDARY_SET.Tarot
          end
        end
        return false
      end
    }
  end,
}
