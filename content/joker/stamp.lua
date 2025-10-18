SMODS.Joker {
  key = "stamp",
  config = {
    extra = {
      chips = 0,
      chip_mod = 25,
      numerator = 2,
      denominator = 5,
    }
  },
  rarity = 3,
  pos = { x = 8, y = 0 },
  atlas = "jokers_atlas",
  cost = 8,
  unlocked = false,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = false,
  pixel_size = { w = 35, h = 45 },

  in_pool = function(self, args)
    if G.playing_cards then
      for _, card in ipairs(G.playing_cards) do
        if card.seal then
          return true
        end
      end
    end
  end,

  check_for_unlock = function(self, args)
    if args.type == "hand" then
      local seals = 0

      for k, v in ipairs(args.scoring_hand or {}) do
        if v:get_seal() then seals = seals + 1 end
      end

      return seals >= 5
    end
  end,

  locked_loc_vars = function(self, info_queue, card)
    return {
      vars = { 5 }
    }
  end,
  loc_vars = function(self, info_queue, card)
    local numerator, denominator = PB_UTIL.chance_vars(card, nil, card.ability.extra.numerator,
      card.ability.extra.denominator)

    return {
      vars = {
        numerator,
        denominator,
        card.ability.extra.chip_mod,
        card.ability.extra.chips
      }
    }
  end,

  calculate = function(self, card, context)
    -- Upgrades Joker if seal is played
    if context.individual and not context.blueprint then
      if context.cardarea == G.play then
        if context.other_card:get_seal() then
          -- Gives chips if roll succeeds
          if PB_UTIL.chance(card, 'stamp', self.ability.extra.numerator, self.ability.extra.denominator) then
            card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chip_mod

            card_eval_status_text(card, 'extra', nil, nil, nil,
              { message = localize('k_upgrade_ex'), colour = G.C.CHIPS })
          end
        end
      end
    end

    -- Gives the chips during play
    if context.joker_main then
      return {
        chips = card.ability.extra.chips,
        card = card
      }
    end
  end,

  joker_display_def = function(JokerDisplay)
    return {
      text = {
        { text = "+" },
        { ref_table = "card.ability.extra", ref_value = "chips", retrigger_type = "mult" }
      },
      text_config = { colour = G.C.CHIPS },
      extra = {
        {
          { text = '(' },
          { ref_table = 'card.joker_display_values', ref_value = 'odds' },
          { text = ')' },
        },
      },
      extra_config = {
        colour = G.C.GREEN,
        scale = 0.3,
      },
      calc_function = function(card)
        card.joker_display_values.odds = localize { type = 'variable', key = 'jdis_odds',
          vars = {
            PB_UTIL.chance_vars(card, nil, card.ability.extra.numerator,
              card.ability.extra.denominator)
          }
        }
      end
    }
  end,
}
