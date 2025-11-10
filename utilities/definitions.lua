-- Load mod config
PB_UTIL.config = SMODS.current_mod.config

-- Enable optional features
SMODS.current_mod.optional_features = {
  retrigger_joker = true,
  post_trigger = true,
  quantum_enhancements = true,
  cardareas = {
    deck = true
  }
}

-- Global mod calculate
SMODS.current_mod.calculate = function(self, context)
  -- green clip: gain mult for every other played and scored clip
  if context.before then
    local clips_played = 0
    for _, v in ipairs(context.scoring_hand) do
      if not v.debuff and PB_UTIL.has_paperclip(v) then clips_played = clips_played + 1 end
    end
    if clips_played > 0 then
      for _, v in ipairs(G.playing_cards) do
        local clip = PB_UTIL.has_paperclip(v)
        if clip == "paperback_green_clip" and not v.debuff then
          local clip_table = v.ability.paperback_green_clip
          local clips_played_plus_odd = clip_table.odd + clips_played
          -- Every 2 clips go into mult,
          -- remaining odd clip goes to `odd`
          clip_table.mult = clip_table.mult + clip_table.mult_plus * math.floor(clips_played_plus_odd / 2)
          clip_table.odd = clips_played_plus_odd % 2
        end
      end
    end
  end

  -- green clip: lose mult for each discarded clip
  if context.discard then
    if PB_UTIL.has_paperclip(context.other_card) and not context.other_card.debuff then
      for _, v in ipairs(G.playing_cards) do
        local clip = PB_UTIL.has_paperclip(v)
        if clip == "paperback_green_clip" and not v.debuff then
          local clip_table = v.ability.paperback_green_clip
          clip_table.mult = math.max(0, clip_table.mult - clip_table.mult_minus)
        end
      end
    end
  end

  -- purple clip: retrigger card if it has a clip and is adjacent to a purple clip
  if context.repetition then
    local area_cards
    if context.cardarea == 'unscored' then
      area_cards = {}
      local scoring_hand_i = 1
      -- Run through `full_hand`. Take cards if they aren't in `scoring_hand`
      -- We only need to check scoring_hand[scoring_hand_i] at each point
      for _, c in ipairs(context.full_hand) do
        if context.scoring_hand[scoring_hand_i] == c then
          scoring_hand_i = scoring_hand_i + 1
        else
          table.insert(area_cards, c)
        end
      end
    elseif context.cardarea == G.play then
      area_cards = context.scoring_hand
    else
      area_cards = context.cardarea.cards
    end

    local index
    for k, v in ipairs(area_cards) do
      if v == context.other_card then
        index = k
        break
      end
    end

    if index then
      local left = area_cards[index - 1]
      local right = area_cards[index + 1]
      local reps = 0
      if left and PB_UTIL.has_paperclip(left) == "paperback_purple_clip" then
        reps = reps + 1
      end
      if right and PB_UTIL.has_paperclip(right) == "paperback_purple_clip" then
        reps = reps + 1
      end
      if PB_UTIL.has_paperclip(context.other_card) and reps > 0 then
        return {
          repetitions = reps,
          message_card = context.other_card,
          colour = G.C.PURPLE
        }
      end
    end
  end

  -- track Tarot + Minor Arcana usage for 8 of Pentacles
  if context.using_consumeable then
    local center = context.consumeable.config.center
    local add_new = true
    if center.set == "Tarot" or center.set == "paperback_minor_arcana" then
      for _, v in ipairs(G.GAME.paperback.arcana_used) do
        if center.key == v then
          add_new = false
          break
        end
      end
      if add_new then
        G.GAME.paperback.arcana_used[#G.GAME.paperback.arcana_used + 1] = center.key
      end
    end
  end

  -- Keep Solar System global variable updated
  if context.paperback and context.paperback.level_up then
    PB_UTIL.update_solar_system(card)
  end
  -- Keep Reference Card global variable updated
  if context.before then
    PB_UTIL.calculate_highest_shared_played(card)
  end
end

-- Sleeved cards can't be debuffed
SMODS.current_mod.set_debuff = function(card)
  if SMODS.has_enhancement(card, "m_paperback_sleeved") then
    return "prevent_debuff"
  end
end

-- Update values that get reset at the start of each round
SMODS.current_mod.reset_game_globals = function(run_start)
  G.GAME.paperback.round.scored_clips = 0
  G.GAME.paperback.weather_radio_hand = PB_UTIL.get_random_visible_hand('weather_radio')
  G.GAME.paperback.joke_master_hand = PB_UTIL.get_random_visible_hand('joke_master')
  -- Shopkeep
  local shopkeeps = SMODS.find_card('j_paperback_shopkeep')
  if #shopkeeps > 0 then
    for _, joker in ipairs(shopkeeps) do
      joker.ability.extra.incremented = false
    end
  end
  -- Vacation Juice
  G.GAME.paperback.vacation_juice_trigger = false
  if not run_start then
    G.GAME.paperback.last_blind_type_defeated_this_ante = G.GAME.blind:get_type()
    if G.GAME.round_resets.blind_states.Boss == 'Defeated' then
      G.GAME.paperback.last_blind_type_defeated_this_ante = nil
    end
  end
  if run_start then
    -- Set last_scored_suit to a sensible value.
    -- Mostly matters if Jester of Nihil is obtained before the first blind
    -- on a deck with different suit distribution, like Checkered + Dreamer Deck/Sleeve
    -- Might still fail if Joker is created before the run even begins?
    G.E_MANAGER:add_event(Event({
      func = function()
        local cards = {}
        for k, v in ipairs(G.playing_cards) do
          if not SMODS.has_no_suit(v) then
            cards[#cards + 1] = v
          end
        end
        local selected = pseudorandom_element(cards, pseudoseed('paperback_last_scored_suit'))
        if selected then G.GAME.paperback.last_scored_suit = selected.base.suit end
        return true
      end
    }))
    G.GAME.paperback.banned_run_keys = {}
  end
end

PB_UTIL.credits = {
  artists = {
    color = G.C.MULT,
    entries = {
      'PaperMoon',
      '「S_C_R_U_B_Y」',
      'Firch',
      'Fennex'
    }
  },
  developers = {
    color = G.C.GREEN,
    entries = {
      'OppositeWolf770, srockw, Nether, B, ejwu2, metanite64, TheSnaz',
      'InfinityPlus05, aliahmed2k03'
    }
  },
  localization = {
    color = G.C.FILTER,
    entries = {
      'pinkmaggit-hub & Riosodu (pt-BR)',
      'mathieulievre (FR)',
      'BurAndBY & Tauookie (RU)',
      'Ethylene (zh_CN)',
      'Marffe (es_ES & es_419)',
    }
  },
  music = {
    color = G.C.PURPLE,
    entries = {
      'Larantula'
    }
  }
}

PB_UTIL.base_poker_hands = {
  "Straight Flush",
  "Four of a Kind",
  "Full House",
  "Flush",
  "Straight",
  "Three of a Kind",
  "Two Pair",
  "Pair",
  "High Card"
}

PB_UTIL.base_ranks = {
  "Ace",
  "King",
  "Queen",
  "Jack",
  "10",
  "9",
  "8",
  "7",
  "6",
  "5",
  "4",
  "3",
  "2"
}

PB_UTIL.base_rarities = {
  "Common",
  "Uncommon",
  "Rare",
  "Legendary"
}

PB_UTIL.base_suits = {
  "Spades",
  "Hearts",
  "Clubs",
  "Diamonds"
}

PB_UTIL.vanilla_food = {
  j_gros_michel = true,
  j_egg = true,
  j_ice_cream = true,
  j_cavendish = true,
  j_turtle_bean = true,
  j_diet_cola = true,
  j_popcorn = true,
  j_ramen = true,
  j_selzer = true,
}

-- Define light and dark suits
PB_UTIL.light_suits = { 'Diamonds', 'Hearts' }
PB_UTIL.dark_suits = { 'Spades', 'Clubs' }

-- Add Crowns and Stars if enabled
if PB_UTIL.config.suits_enabled then
  table.insert(PB_UTIL.light_suits, 'paperback_Stars')
  table.insert(PB_UTIL.dark_suits, 'paperback_Crowns')
end

PB_UTIL.requirement_map = {
  requires_custom_suits = {
    setting = 'suits_enabled',
    tooltip = 'paperback_requires_custom_suits'
  },
  requires_enhancements = {
    setting = 'enhancements_enabled',
    tooltip = 'paperback_requires_enhancements'
  },
  requires_paperclips = {
    setting = 'paperclips_enabled',
    tooltip = 'paperback_requires_paperclips'
  },
  requires_minor_arcana = {
    setting = 'minor_arcana_enabled',
    tooltip = 'paperback_requires_minor_arcana'
  },
  requires_tags = {
    setting = 'tags_enabled',
    tooltip = 'paperback_requires_tags'
  },
  requires_editions = {
    setting = 'editions_enabled',
    tooltip = 'paperback_requires_editions'
  },
  requires_ranks = {
    setting = 'ranks_enabled',
    tooltip = 'paperback_requires_ranks'
  },
  requires_ego_gifts = {
    setting = 'ego_gifts_enabled',
    tooltip = 'paperback_requires_ego_gifts'
  }
}

-- Disable specific items by commenting them out
PB_UTIL.ENABLED_JOKERS = {
  "calling_card",
  "forgery",
  "wish_you_were_here",
  "quick_fix",
  "sacrificial_lamb",
  "the_one_who_waits",
  "unholy_alliance",
  "stamp",
  "solar_system",
  "pool_table",
  -- "moai",
  "meeple",
  "solemn_lament",
  "boundary_of_death",
  "furioso",
  "mismatched_sock",
  "wild_plus_four",
  "basic_energy",
  "punch_card",
  "jestrogen",
  "jestosterone",
  "reference_card",
  "oracle",
  "skydiver",
  "surfer",
  "apple",
  "freezer",
  "joker_cookie",
  "double_dutchman",
  "nachos",
  "crispy_taco",
  "soft_taco",
  -- "watermelon",
  "complete_breakfast",
  "ghost_cola",
  "b_soda",
  "marble_soda",
  "vacation_juice",
  "black_forest_cake",
  "ice_cube",
  "cream_liqueur",
  "deviled_egg",
  "champagne",
  "coffee",
  "matcha",
  "pinot_noir",
  "milk_tea",
  "epic_sauce",
  "dreamsicle",
  "popsicle_stick",
  "cakepop",
  "pop_stick",
  "caramel_apple",
  "pointy_stick",
  "charred_marshmallow",
  "sticky_stick",
  "pear",
  "teapot",
  "sake_cup",
  "full_moon",
  "black_rainbows",
  "emergency_broadcast",
  "blue_marble",
  "triple_moon_goddess",
  "as_above_so_below",
  "one_sin_and_hundreds_of_good_deeds",
  "plague_doctor",
  "white_night",
  "angel_investor",
  -- "der_freischutz",
  "card_sleeve",
  -- "plastic_wrap",
  "shopping_center",
  "everything_must_go",
  "tutor",
  "percussion_ensemble",
  "its_tv_time",
  "eyelander",
  -- "torii",
  -- "freight",
  "high_speed_rail",
  "small_scale_onshore_wind",
  "satellite_array",
  -- "first_contact",
  "aurora_borealis",
  "grand_strategy",
  "moving_out",
  "ready_to_fly",
  "great_wave",
  "let_it_happen",
  -- "paralyzed"
  "in_case_i_make_it",
  "rosary_beads",
  "joker_cd_i",
  "determination",
  "prince_of_darkness",
  "giga_size",
  "photocopy",
  "mandela_effect",
  "jester_of_nihil",
  "shopkeep",
  "wild_prize",
  "deadringer",
  "penumbra_phantasm",
  "a_balatro_movie",
  "ncj",
  "bicycle",
  -- "mezzetino",
  -- "gauze",
  "joke_master",
  -- "jokers_11",
  -- "book_of_life",
  -- "hamsa",
  -- "hamsa_r",
  -- "nazar",
  -- "prescript",
  "trans_flag",
  "pride_flag",
  "bismuth",
  "cherry_blossoms",
  "hole_in_one",
  "blue_bonnets",
  "derecho",
  "autumn_leaves",
  "river",
  "evergreens",
  "master_plan",
  "the_wonder_of_you",
  "tian_tian",
  "backpack",
  "roulette",
  "mexican_train",
  "chocolate_joker",
  "resurrections",
  "summoning_circle",
  "the_sun",
  "union_card",
  "book_of_vengeance",
  "moribund",
  "subterfuge",
  "the_world",
  -- "red_sun",
  "the_sun_rises",
  "blood_rain",
  -- "war_without_reason",
  "paranoia",
  "der_fluschutze",
  "touch_tone_joker",
  -- "the_batter",
  -- "off_switch",
  -- "alpha",
  -- "omega",
  -- "epsilon",
  "jestrica",
  "you_are_a_fool",
  "alert",
  "legacy",
  -- "redscreen",
  "telamon",
  "weather_radio",
  "power_surge",
  "time_regression_mix",
  "find_jimbo",
  "joker_crossing",
  -- "tower_of_balatro",
  "jimbos_inferno",
  "tome",
  "greeting_card",
  -- "an_invitation",
  "jimbocards",
  "forlorn",
  "protocol",
  "showdown",
  "guns_blazin",
  "burning_pact",
  "blade_dance",
  "claw",
  "inner_peace",
  "jimbos_joyous_joker_jamboree",
  "banana_man",
  "the_normal_joker",
  "insurance_policy",
  "disco",
  "unionized_labor",
  "better_call_jimbo",
  "jimbo_adventure",
  "ddakji",
  -- "yacht_dice",
  -- "deck_of_cards",
  "pocket_pair",
  "ultra_rare",
  -- "lore_digger",
  "the_quiet",
  "big_misser",
  --"squall_line",
  "fodder",
  "the_strongest",
  "da_capo",
  "golden_egg",
  "heretical_joker",
  "quartz",
  "rock_candy",
  "rockin_stick",
  "birches",
  "black_star",
  "shooting_star",
  "blue_star",
  "shadowmantle",
  "zealous_joker",
  "lurid_joker",
  "the_dynasty",
  "j_and_js",
  "master_spark",
  "prism",
  "fraudulent_joker",
  "pyrite",
  "tanghulu",
  "sweet_stick",
  "wheat_field",
  "solar_eclipse",
  "gambit",
  "king_me",
  "manilla_folder",
  -- "joker_duty",
  "clippy",
  "clothespin",
  "kintsugi_joker",
  -- "happy_accident",
  "watercolor_joker",
  "medic",
  "festive_joker",
  "sommelier",
  "spotty_joker",
  "collector",
  "langely",
  "pedrillo",
  "nichola",
  "chaplin",
  -- "shinzaemon",
}

PB_UTIL.ENABLED_MINOR_ARCANA = {
  "ace_of_cups",
  "two_of_cups",
  "three_of_cups",
  "four_of_cups",
  "five_of_cups",
  "six_of_cups",
  "seven_of_cups",
  "eight_of_cups",
  "nine_of_cups",
  "ten_of_cups",
  "page_of_cups",
  "knight_of_cups",
  "queen_of_cups",
  "king_of_cups", -- CUPS
  "ace_of_wands",
  "two_of_wands",
  "three_of_wands",
  "four_of_wands",
  "five_of_wands",
  "six_of_wands",
  "seven_of_wands",
  "eight_of_wands",
  "nine_of_wands",
  "ten_of_wands",
  "page_of_wands",
  "knight_of_wands",
  "queen_of_wands",
  "king_of_wands", -- WANDS
  "ace_of_swords",
  "two_of_swords",
  "three_of_swords",
  "four_of_swords",
  "five_of_swords",
  "six_of_swords",
  "seven_of_swords",
  "eight_of_swords",
  "nine_of_swords",
  "ten_of_swords",
  "page_of_swords",
  "knight_of_swords",
  "queen_of_swords",
  "king_of_swords", -- SWORDS
  "ace_of_pentacles",
  "two_of_pentacles",
  "three_of_pentacles",
  "four_of_pentacles",
  "five_of_pentacles",
  "six_of_pentacles",
  "seven_of_pentacles",
  "eight_of_pentacles",
  "nine_of_pentacles",
  "ten_of_pentacles",
  "page_of_pentacles",
  "knight_of_pentacles",
  "queen_of_pentacles",
  "king_of_pentacles", -- PENTACLES
}

PB_UTIL.ENABLED_EGO_GIFTS = {
  'imposed_weight',
  'phlebotomy_pack',
  'smokes_and_wires',
  'coffee_and_cranes',
  'fiery_down',
  'decamillennial_stewpot',
  'downpour',
  'rusty_coin',
  'ragged_umbrella',
  'thrill',
  'disk_fragment',
  'death_seeker',
  'pendant_of_nostalgia',
  'blue_lighter',
  'broken_glasses',
  'nebulizer',
  'tomorrow_fortune',
  'fluorescent_lamp',
  'lightning_rod',
  'chalice_of_trickle_down',
  'patrolling_flashlight',
  'golden_bough',
  'dark_vestige',
}

PB_UTIL.ENABLED_SPECTRALS = {
  "apostle_of_cups",
  "apostle_of_wands",
  "apostle_of_swords",
  "apostle_of_pentacles",


}

PB_UTIL.ENABLED_BLINDS = {
  "quarter",
  "half",
  "whole",
  "rest",
  "flat",
  "sharp",
  "natural",
  "coda",
  -- "hold",
  -- "glissando",
  -- "denim_da_capo",
  -- "misty_bass",
  "taupe_treble"
  -- "black_silence",
  -- "pearlescent_orchestra",
  -- "scarlet_score",

  -- "alphabet",
  -- "bellcurve",
  -- "claw",
  -- "door",
  -- "electric",
  -- "finger",
  -- "guild",
  -- "hunger",
  -- "index",
  -- "joker",
  -- "knight",
  -- "lingering",
  -- "mistake",
  -- "noxious",
  -- "origin",
  -- "painting",
  -- "quiz",
  -- "reaping",
  -- "sowing",
  -- "taboo",
  -- "unit",
  -- "vice",
  -- "wish",
  -- "x-ray",
  -- "year",
  -- "zealot",
}

PB_UTIL.DECK_SKINS = {
  {
    id = 'steven_universe',
    name = 'Steven Universe',
    suits = {
      'Spades',
      'paperback_Stars'
    }
  },
  {
    id = 'atlyss',
    name = 'Atlyss',
    suits = {
      'Clubs',
      'bunc_Fleurons'
    }
  },
  {
    id = 'flight_knight',
    name = 'Flight Knight',
    suits = {
      'Hearts',
      'bunc_Halberds'
    }
  },
  {
    id = 'hylics',
    name = 'Hylics',
    suits = {
      'Diamonds',
      'paperback_Crowns'
    }
  },
  {
    id = 'steel_ball',
    name = "Steel Ball Run",
    suits = {
      'paperback_Stars'
    }
  },
  {
    id = 'cult_of_the_lamb',
    name = "Cult of the Lamb",
    suits = {
      'paperback_Crowns'
    }
  },
  {
    id = 'smiling_friends',
    name = "Smiling Friends",
    suits = {
      'Hearts'
    }
  },
  {
    id = 'super_mario_bros_z',
    name = "Super Mario Bros. Z",
    suits = {
      'Clubs'
    }
  },
  {
    id = 'dragon_ball_z',
    name = "Dragon Ball Z",
    suits = {
      'Diamonds'
    }
  },
  {
    id = 'chrono_trigger',
    name = "Chrono Trigger",
    suits = {
      'Spades'
    }
  },
  {
    id = 'deltarune',
    name = "Deltarune",
    suits = {
      'paperback_Stars'
    }
  },
  {
    id = 'celeste',
    name = "Celeste",
    suits = {
      'paperback_Crowns'
    }
  },
  {
    id = 'primarina',
    name = "Pokemon (Primarina)",
    suits = {
      'Hearts'
    }
  },
  {
    id = 'serperior',
    name = "Pokemon (Serperior)",
    suits = {
      'Clubs'
    }
  },
  {
    id = 'delphox',
    name = "Pokemon (Delphox)",
    suits = {
      'Diamonds'
    }
  },
  {
    id = 'gardevoir',
    name = "Pokemon (Gardevoir)",
    suits = {
      'Spades'
    }
  },
}

PB_UTIL.ENABLED_MINOR_ARCANA_BOOSTERS = {
  'minor_arcana_normal_1',
  'minor_arcana_normal_2',
  'minor_arcana_normal_3',
  'minor_arcana_normal_4',
  'minor_arcana_jumbo_1',
  'minor_arcana_jumbo_2',
  'minor_arcana_mega',
  'minor_arcana_mega_2',
}

PB_UTIL.ENABLED_EGO_GIFT_BOOSTERS = {
  'ego_gift_normal_1',
}

PB_UTIL.ENABLED_VOUCHERS = {
  'celtic_cross',
  'soothsay',
  -- 'filing_cabinet',
  -- 'paperclip_optimization',
  'second_trumpet',
  'rabbit_protocol',
}

PB_UTIL.ENABLED_TAGS = {
  'angel_investment',
  'divination',
  'dichrome',
  'high_risk',
  'breaking',
}

PB_UTIL.ENABLED_ENHANCEMENTS = {
  "wrapped",
  "bandaged",
  "ceramic",
  "soaked",
  "stained",
  "domino",
  "sleeved",
  "antique"
}

PB_UTIL.ENABLED_EDITIONS = {
  'dichrome'
}

PB_UTIL.ENABLED_RANKS = {
  'apostle'
}

PB_UTIL.ENABLED_SUITS = {
  'crowns',
  'stars',
}

PB_UTIL.ENABLED_POKER_HANDS = {
  'spectrum',
  'straight_spectrum',
  'spectrum_house',
  'spectrum_five',
}

PB_UTIL.ENABLED_PLANETS = {
  'quaoar',
  'haumea',
  'sedna',
  'makemake',
}

PB_UTIL.ENABLED_DECKS = {
  'paper',
  'proud',
  'silver',
  'dreamer',
  'antique',
  'passionate',
  'shimmering',
}

PB_UTIL.ENABLED_STICKERS = {
  'energized',
  'temporary',
  'corroded'
}

-- Define a Booster object with certain shared properties for Minor Arcana packs
if PB_UTIL.config.minor_arcana_enabled then
  PB_UTIL.MinorArcanaBooster = SMODS.Booster:extend {
    group_key = 'paperback_minor_arcana_pack',
    kind = 'paperback_minor_arcana',
    draw_hand = true,

    loc_vars = function(self, info_queue, card)
      local orig = SMODS.Booster.loc_vars(self, info_queue, card)
      -- Removes the underscore with a digit at the end of a key if it exists,
      -- allowing us to make only one localization entry per type
      orig['key'] = self.key:gsub('_%d$', '')
      return orig
    end,

    create_card = function(self, card, i)
      return {
        set = 'paperback_minor_arcana',
        area = G.pack_cards,
        skip_materialize = true,
        soulable = true -- Allow creating Apostle cards
      }
    end,

    ease_background_colour = function(self)
      ease_colour(G.C.DYN_UI.MAIN, G.C.PAPERBACK_MINOR_ARCANA)
      ease_background_colour { new_colour = G.C.PAPERBACK_MINOR_ARCANA, special_colour = G.C.BLACK, contrast = 2 }
    end,
  }
end

-- Define Paperclip object
if PB_UTIL.config.paperclips_enabled then
  PB_UTIL.Paperclip = SMODS.Sticker:extend {
    prefix_config = { key = true },
    should_apply = function(self, card, center, area, bypass_roll)
      return bypass_roll
    end,
    config = {},
    rate = 0,
    sets = {
      Default = true
    },

    draw = function(self, card)
      local x_offset = (card.T.w / 71) * -4 * card.T.scale
      G.shared_stickers[self.key].role.draw_major = card
      G.shared_stickers[self.key]:draw_shader('dissolve', nil, nil, nil, card.children.center, nil, nil, x_offset)
      if self.shiny then
        G.shared_stickers[self.key]:draw_shader('voucher', nil, card.ARGS.send_to_shader, nil, card.children.center, nil,
          nil, x_offset)
      end
    end,

    apply = function(self, card, val)
      card.ability[self.key] = val and copy_table(self.config) or nil
    end
  }
end

-- Define custom MinorArcana object with shared properties for handling common behavior
if PB_UTIL.config.minor_arcana_enabled then
  --- @type SMODS.Consumable
  PB_UTIL.MinorArcana = SMODS.Consumable:extend {
    set = 'paperback_minor_arcana',
    unlocked = true,
    discovered = false,

    loc_vars = function(self, info_queue, card)
      if not self.config then return end

      if card.ability.paperclip then
        info_queue[#info_queue + 1] = PB_UTIL.paperclip_tooltip(card.ability.paperclip)

        return {
          vars = {
            card.ability.max_highlighted
          }
        }
      elseif card.ability.mod_conv then
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]

        return {
          vars = {
            card.ability.max_highlighted,
            localize {
              type = 'name_text',
              set = 'Enhanced',
              key = card.ability.mod_conv
            }
          }
        }
      elseif card.ability.suit_conv then
        return {
          vars = {
            card.ability.max_highlighted,
            localize(card.ability.suit_conv, 'suits_plural'),
            colours = {
              G.C.SUITS[card.ability.suit_conv]
            }
          }
        }
      end
    end,

    use = function(self, card, area)
      if not self.config then return end

      if card.ability.paperclip or card.ability.mod_conv or card.ability.suit_conv then
        PB_UTIL.use_consumable_animation(card, G.hand.highlighted, function()
          for _, v in ipairs(G.hand.highlighted) do
            if card.ability.paperclip then
              PB_UTIL.set_paperclip(v, card.ability.paperclip)
            elseif card.ability.mod_conv then
              v:set_ability(G.P_CENTERS[card.ability.mod_conv])
            else
              SMODS.change_base(v, card.ability.suit_conv)
            end
          end
        end)
      end
    end
  }
end

-- Define a Booster object with certain shared properties for E.G.O. Gift packs
if PB_UTIL.config.ego_gifts_enabled then
  PB_UTIL.EGO_GiftBooster = SMODS.Booster:extend {
    group_key = 'paperback_ego_gift_pack',
    kind = 'paperback_ego_gift',
    draw_hand = false,
    select_card = 'consumeables',

    loc_vars = function(self, info_queue, card)
      local orig = SMODS.Booster.loc_vars(self, info_queue, card)
      -- Removes the underscore with a digit at the end of a key if it exists,
      -- allowing us to make only one localization entry per type
      orig['key'] = self.key:gsub('_%d$', '')
      return orig
    end,

    create_card = function(self, card, i)
      return {
        set = 'paperback_ego_gift',
        area = G.pack_cards,
        skip_materialize = true,
        soulable = true,
        key_append = 'paperback_extr'
      }
    end,

    ease_background_colour = function(self)
      ease_colour(G.C.DYN_UI.MAIN, G.C.PAPERBACK_EGO_GIFT_RED)
      ease_background_colour { new_colour = G.C.PAPERBACK_EGO_GIFT_YELLOW, special_colour = G.C.BLACK, contrast = 2 }
    end,
  }
end

-- Define custom EGO_Gifts object with shared properties for handling common behavior
if PB_UTIL.config.ego_gifts_enabled then
  -- Vars for Calc and Loc
  PB_UTIL.EGO_GIFT_SINS = {
    none = { 5 },
    wrath = {},
    lust = { 2 },
    sloth = {},
    gluttony = {},
    gloom = { 1.5 },
    pride = { -15, SMODS.signed_dollars(-15) },
    envy = { 1 },
  }
  -- Tables for the standardized sin calc
  PB_UTIL.SIN_DEBUFF = {
    none = {},
    wrath = {
      func = function()
        SMODS.destroy_cards(G.consumeables.cards)
      end
    },
    lust = {
      func = function()
        local _hand, _tally = nil, 1
        for k, v in ipairs(G.handlist) do
          if G.GAME.hands[v].visible and G.GAME.hands[v].played >= _tally then
            _hand = v
            _tally = G.GAME.hands[v].played
          end
        end
        if _hand then
          local lvls_down = math.min(PB_UTIL.EGO_GIFT_SINS.lust[1], G.GAME.hands[_hand].level - 1)
          if to_big(lvls_down) > to_big(0) then
            SMODS.smart_level_up_hand(nil, _hand, false, -lvls_down)
            return nil, true
          end
        end
      end
    },
    gluttony = {
      func = function()
        local compatible = {}
        local perish = nil
        for _, target in ipairs(G.jokers.cards) do
          if target.config.center.perishable_compat and not (target.ability.eternal or target.ability.perishable) then
            compatible[#compatible + 1] = target
          end
        end

        if next(G.jokers.cards) and next(compatible) then
          perish = pseudorandom_element(compatible, pseudoseed('paperback_gluttony'))
          SMODS.Stickers["perishable"]:apply(perish, true)
          perish:juice_up()
        end
      end
    },
    gloom = {
      func = function()
        G.GAME.paperback.blind_multiplier = G.GAME.paperback.blind_multiplier * PB_UTIL.EGO_GIFT_SINS.gloom[1]
      end
    },
    envy = {
      func = function()
        G.hand:change_size(-PB_UTIL.EGO_GIFT_SINS.envy[1])
      end
    },
    madness = {
      func = function()
        local jokers = {}
        for i, v in ipairs(G.jokers.cards) do
          if not SMODS.is_eternal(v) and not v.getting_sliced then
            jokers[#jokers + 1] = v
          end
        end
        local target = pseudorandom_element(jokers, pseudoseed("golden_bough_destruction"))
        if target then
          SMODS.destroy_cards({ target })
        end
      end
    },
  }
  --- @type SMODS.Consumable
  PB_UTIL.EGO_Gift = SMODS.Consumable:extend {
    badge_text_colour = G.C.PAPERBACK_EGO_GIFT_YELLOW,
    set = 'paperback_ego_gift',
    unlocked = true,
    discovered = false,
    cost = 0,
    -- This card is always selected, not used. It goes to the 'consumeables' area
    select_card = "consumeables",

    loc_vars = function(self, info_queue, card)
      info_queue[#info_queue + 1] = PB_UTIL.sin_tooltip(card.ability.sin)
      local loc = {}
      if self.ego_loc_vars then
        loc = self.ego_loc_vars(self, info_queue, card)
      end
      return loc
    end,

    calculate = function(self, card, context)
      if context.selling_self then
        if card.ability.sin then
          G.GAME.paperback.sold_ego_gifts[#G.GAME.paperback.sold_ego_gifts + 1] = card
          check_for_unlock({ type = 'paperback_sold_ego_gifts' })
          SMODS.calculate_context({
            paperback = {
              sold_ego_gift = card,
            }
          })
          if not card.ability.paperback_corroded then
            local sin = card.ability.sin
            return PB_UTIL.SIN_DEBUFF[sin]
          end
          return {
            message = localize('paperback_corroded_ex')
          }
        end
      end

      if self.ego_gift_calc then
        return self:ego_gift_calc(card, context)
      end
    end,
    set_card_type_badge = function(self, card, badges)
      badges[#badges + 1] = create_badge(localize('k_paperback_ego_gift'), G.C.PAPERBACK_EGO_GIFT_RED,
        G.C.PAPERBACK_EGO_GIFT_YELLOW, 1.2)
    end,

    set_badges = function(self, card, badges)
      if card.ability.sin then
        local badge_key = 'k_paperback_ego_sin_' .. card.ability.sin
        if card.ability.sin == 'none' or card.ability.sin == 'madness' then
          badges[#badges + 1] = create_badge(localize(badge_key), G.C
            ['PAPERBACK_SIN_' .. string.upper(card.ability.sin)],
            G.C.PAPERBACK_BLACK, 1.2)
        else
          badges[#badges + 1] = create_badge(localize(badge_key), G.C
            ['PAPERBACK_SIN_' .. string.upper(card.ability.sin)],
            G.C.WHITE, 1.2)
        end
      end
    end,

    add_to_deck = function(self, card, from_debuff)
      PB_UTIL.set_sell_value(card, 0)
      local dupe = false
      for i, v in ipairs(G.consumeables.cards) do
        if v.config.center.key == card.config.center.key and v.ability.sin ~= 'none' and card.ability.sin ~= 'none' and v ~= card then
          dupe = true
        end
      end
      if dupe then
        local vestige = SMODS.add_card { key = 'c_paperback_dark_vestige' }
        G.GAME.paperback.destroy_no_calc = true
        SMODS.destroy_cards({ card })
        G.GAME.paperback.destroy_no_calc = nil
      end

      if self.ego_add then
        self:ego_add(card, from_debuff)
      end
    end,

    remove_from_deck = function(self, card, from_debuff)
      if self.ego_remove then
        self:ego_remove(card, from_debuff)
      end
    end,

    can_use = function(self, card)
      return false
    end
  }
end

if PB_UTIL.config.suits_enabled then
  --- @type SMODS.Consumable
  PB_UTIL.Planet = SMODS.Consumable:extend {
    set = "Planet",
    is_dwarf = false,

    -- Since the description of all planets is the same, we just copy it from a random one
    -- The name of this planet still needs to be specified in the localization file
    process_loc_text = function(self)
      G.localization.descriptions[self.set][self.key] = {
        text = G.localization.descriptions[self.set].c_mercury.text
      }
    end,

    set_card_type_badge = function(self, card, badges)
      badges[#badges + 1] = create_badge(
        not self.is_dwarf and localize('k_planet_q') or localize('k_dwarf_planet'),
        get_type_colour(self, card),
        nil,
        1.2
      )
    end,

    -- By making this not a function, the game will use the vanilla UI generation
    generate_ui = 'Nope!'
  }
end

--- @alias Paperclip "blue" | "black" | "white" | "red" | "orange" | "pink" | "yellow" | "gold" | "platinum"
PB_UTIL.ENABLED_PAPERCLIPS = {
  "white_clip",
  "black_clip",
  "gold_clip",
  "red_clip",
  "orange_clip",
  "yellow_clip",
  "green_clip",
  "blue_clip",
  "purple_clip",
  "pink_clip",
  "platinum_clip"
}
--- @alias Special_Paperclip  "platinum"
PB_UTIL.SPECIAL_PAPERCLIPS = {
  "platinum_clip"
}
