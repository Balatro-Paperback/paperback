-- Talisman compatibility
to_big = to_big or function(n)
  return n
end

to_number = to_number or function(n)
  return n
end

-- Load modded suits
if next(SMODS.find_mod('Bunco')) then
  local prefix = SMODS.find_mod('Bunco')[1].prefix or "bunc"

  --Adding shades to the Bunco suits via take_ownership until they add their own shades
  SMODS.Suit:take_ownership(prefix .. '_Fleurons', {
    shade = 'light'
  }, true)
  SMODS.Suit:take_ownership(prefix .. '_Halberds', {
    shade = 'dark'
  }, true)
end

if next(SMODS.find_mod('partner')) then
  -- Register the Partner cross-mod atlas
  SMODS.Atlas {
    key = 'partners_atlas',
    path = 'Partners.png',
    px = 46,
    py = 58,
  }
  -- list of Partner keys
  local partners = {
    "virtual",
    "aftermath",
    "faker",
  }

  PB_UTIL.register_items(partners, "content/partner")
end

if next(SMODS.find_mod('CardSleeves')) then
  SMODS.Atlas {
    key = 'card_sleeves_atlas',
    path = 'CardSleeves.png',
    px = 73,
    py = 95
  }

  local sleeves = {
    'paper',
    'proud',
    'silver',
    'dreamer',
    'antique',
    'passionate',
    -- 'shimmering',
  }

  PB_UTIL.Sleeve = CardSleeves.Sleeve:extend {
    is_buffed = function(self)
      return self.get_current_deck_key() == self.deck_buff
    end,

    loc_key = function(self)
      return self:is_buffed() and (self.key .. '_buff')
    end,

    loc_vars = function(self, info_queue, card)
      return {
        key = self:loc_key()
      }
    end
  }

  PB_UTIL.register_items(sleeves, "content/cardsleeves")
end

-- JokerDisplay hook to calculate retriggers from Paperback features
if JokerDisplay then
  local calculate_card_triggers_ref = JokerDisplay.calculate_card_triggers
  JokerDisplay.calculate_card_triggers = function(card, scoring_hand, held_in_hand)
    local triggers = calculate_card_triggers_ref(card, scoring_hand, held_in_hand)

    -- Return 0 if the card is debuffed
    if triggers == 0 then
      return 0
    end

    -- Store the scoring_hand for quick lookup
    local scoring_hand_set = {}
    for _, v in pairs(scoring_hand or {}) do
      scoring_hand_set[v] = true
    end

    -- If card has a black paperclip
    if card.ability.paperback_black_clip then
      -- Check for paperclips held in hand (without iterating over scoring_hand again)
      if G.hand and G.hand.cards then
        for _, v in pairs(G.hand.cards) do
          if not scoring_hand_set[v] and not v.debuff and PB_UTIL.has_paperclip(v) then
            triggers = triggers + 1
            break -- Stop after finding one
          end
        end
      end
    end

    -- Bandaged Cards retriggers
    local area_cards = scoring_hand_set[card] and scoring_hand or (card.area and card.area.cards)

    if area_cards then
      -- Sort cards depending on their position in the hand
      table.sort(area_cards, function(a, b)
        -- Make sure cards have a position
        return (a.T and a.T.x or 0) < (b.T and b.T.x or 0)
      end)

      local index

      for k, v in ipairs(area_cards) do
        if v == card then
          index = k
          break
        end
      end

      if index then
        local left = area_cards[index - 1]
        local right = area_cards[index + 1]
        local adjacents = {}
        if left then table.insert(adjacents, left) end
        if right then table.insert(adjacents, right) end

        for _, adj_c in ipairs(adjacents) do
          if adj_c then
            if SMODS.has_enhancement(adj_c, 'm_paperback_bandaged') then
              triggers = triggers + 1 + G.GAME.paperback.bandaged_inc
            end
            if adj_c.ability.paperback_purple_clip and PB_UTIL.has_paperclip(card) then
              triggers = triggers + 1
            end
          end
        end
      end
    end

    return triggers
  end
end

--- JokerDisplay definition for the Panorama Jokers
--- @param JokerDisplay (JokerDisplay)
function PB_UTIL.panorama_joker_display_def(JokerDisplay)
  return {
    text = {
      {
        border_nodes = {
          { text = "X" },
          { ref_table = "card.joker_display_values", ref_value = "xMult", retrigger_type = "exp" },
        }
      }
    },

    reminder_text = {
      { text = "(" },
      { ref_table = "card.joker_display_values", ref_value = "localized_text", colour = G.C.SUITS["Diamonds"] },
      { text = ")" },
    },

    calc_function = function(card)
      local text, _, scoring_hand = JokerDisplay.evaluate_hand()
      local current_mult = card.ability.extra.xMult_base
      local total_multiplier = 1.0
      local segment_multiplier = 1.0

      if text ~= 'Unknown' then
        for k, v in pairs(scoring_hand) do
          if v:is_suit(card.ability.extra.suit) then
            local triggers = JokerDisplay.calculate_card_triggers(v, scoring_hand)
            for _ = 1, triggers do
              segment_multiplier = segment_multiplier * current_mult
              current_mult = current_mult + card.ability.extra.xMult_gain
            end
          else
            total_multiplier = total_multiplier * segment_multiplier
            segment_multiplier = 1
            current_mult = card.ability.extra.xMult_base
          end
        end
        total_multiplier = total_multiplier * segment_multiplier
      end
      card.joker_display_values.xMult = total_multiplier
      card.joker_display_values.localized_text = localize(card.ability.extra.suit, 'suits_plural')
    end,

    style_function = function(card, text, reminder_text, extra)
      if reminder_text and reminder_text.children[2] then
        reminder_text.children[2].config.colour = G.C.SUITS[card.ability.extra.suit]
      end
    end

  }
end

--- JokerDisplay definition for the Stick Food Jokers
---@param JokerDisplay (JokerDisplay)
function PB_UTIL.stick_food_joker_display_def(JokerDisplay)
  return {
    text = {
      { text = '+' },
      { ref_table = 'card.joker_display_values', ref_value = 'mult' },
    },
    text_config = {
      colour = G.C.MULT
    },

    reminder_text = {
      { text = '(' },
      { ref_table = 'card.joker_display_values', ref_value = 'localized_suit', },
      { text = ')' },
    },

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
      local mult = 0
      local text, _, scoring_hand = JokerDisplay.evaluate_hand()

      if text ~= 'Unknown' then
        for _, scoring_card in pairs(scoring_hand) do
          if scoring_card:is_suit(card.ability.extra.suit) then
            local triggers = JokerDisplay.calculate_card_triggers(scoring_card, scoring_hand)
            mult = mult + card.ability.extra.mult * triggers
          end
        end
      end

      card.joker_display_values.mult = mult
      card.joker_display_values.odds = localize { type = 'variable', key = 'jdis_odds', vars = { PB_UTIL.chance_vars(card) } }
      card.joker_display_values.localized_suit = localize(card.ability.extra.suit, 'suits_plural')
    end,

    style_function = function(card, text, reminder_text, extra)
      if reminder_text and reminder_text.children[2] then
        reminder_text.children[2].config.colour = G.C.SUITS[card.ability.extra.suit]
      end
    end
  }
end

--- JokerDisplay definition for the Stick Jokers
---@param JokerDisplay any
---@return table
function PB_UTIL.stick_joker_display_def(JokerDisplay)
  return {
    text = {
      {
        border_nodes = {
          { text = 'X' },
          { ref_table = 'card.joker_display_values', ref_value = 'xMult' },
        }
      }
    },

    calc_function = function(card)
      card.joker_display_values.xMult = PB_UTIL.calculate_stick_xMult(card)
    end
  }
end

--- Whether to load stuff such as hands, planets and jokers related to Spectrums
--- @return boolean
function PB_UTIL.should_load_spectrum_items()
  return not (
    next(SMODS.find_mod('Bunco'))
    or next(SMODS.find_mod("SixSuits"))
    or next(SMODS.find_mod("SpectrumFramework"))
  )
end

PB_UTIL.ENABLED_CROSS_MOD_JOKERS = {
  ['allinjest'] = {
    'moon_waltz'
  }
}

-- Load cross mod Jokers
for mod, jokers in pairs(PB_UTIL.ENABLED_CROSS_MOD_JOKERS) do
  if next(SMODS.find_mod(mod)) then
    for _, joker in ipairs(jokers) do
      table.insert(PB_UTIL.ENABLED_JOKERS, mod .. '/' .. joker)
    end
  end
end

-- Load Malverk textures
if next(SMODS.find_mod('malverk')) then
  Malverk.badges.ego_gift = function(self, card, badges)
      badges[#badges + 1] = create_badge(localize('k_paperback_ego_gift'), G.C.PAPERBACK_EGO_GIFT_RED,
        G.C.PAPERBACK_EGO_GIFT_YELLOW, 1.2)
  end
  if next(SMODS.find_mod('TSpectrals')) then
    AltTexture {
      key = 'spectral_atlas',
      set = 'Spectral',
      path = 'malverk/Trans-Spectrals.png',
      keys = {
        'c_paperback_apostle_of_cups',
        'c_paperback_apostle_of_wands',
        'c_paperback_apostle_of_swords',
        'c_paperback_apostle_of_pentacles',
      },
      display_pos = 'c_paperback_apostle_of_cups',
      loc_txt = {
        name = "Apostles",
      },
      localization = {
        c_paperback_apostle_of_cups = { badge = 'spectrans_card'},
        c_paperback_apostle_of_wands = { badge = 'spectrans_card'},
        c_paperback_apostle_of_swords = { badge = 'spectrans_card'},
        c_paperback_apostle_of_pentacles = { badge = 'spectrans_card'},
      },
    }
    AltTexture {
      key = 'ego_gift_atlas',
      set = 'Spectral',
      path = 'malverk/Trans-EGOGifts.png',
      keys = {
        'c_paperback_golden_bough',
      },
      soul_keys = {
        'c_paperback_golden_bough',
      },
      loc_txt = {
        name = 'Golden Bough',
      },
      localization = {
        c_paperback_golden_bough = { badge = 'ego_gift'},
      },
    }
    TexturePack {
      key = 'spectrans',
      textures = {
        'paperback_spectral_atlas',
        'paperback_ego_gift_atlas'
      },
      localization = true
    }
  elseif next(SMODS.find_mod('LeSpectrals')) then
    AltTexture {
      key = 'spectral_atlas',
      set = 'Spectral',
      path = 'malverk/Lesbian-Spectrals.png',
      keys = {
        'c_paperback_apostle_of_cups',
        'c_paperback_apostle_of_wands',
        'c_paperback_apostle_of_swords',
        'c_paperback_apostle_of_pentacles',
      },
      display_pos = 'c_paperback_apostle_of_cups',
      loc_txt = {
        name = "Apostles",
      },
    }
    AltTexture {
      key = 'ego_gift_atlas',
      set = 'Spectral',
      path = 'malverk/Lesbian-EGOGifts.png',
      keys = {
        'c_paperback_golden_bough',
      },
      soul_keys = {
        'c_paperback_golden_bough',
      },
      loc_txt = {
        name = 'Golden Bough',
      },
      localization = {
        c_paperback_golden_bough = { badge = 'ego_gift'},
      },
    }
    TexturePack {
      key = 'spectralsbian',
      textures = {
        'paperback_spectral_atlas',
        'paperback_ego_gift_atlas'
      },
      localization = true
    }
  end
end