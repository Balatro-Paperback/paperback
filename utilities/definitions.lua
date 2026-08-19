-- Load mod config
PB_UTIL.config = SMODS.current_mod.config

-- Enable optional features
SMODS.current_mod.optional_features = {
  retrigger_joker = true,
  post_trigger = true,
  quantum_enhancements = true
}

-- Global mod calculate
SMODS.current_mod.calculate = function(self, context)
  -- Count the amount of removed playing cards
  if context.remove_playing_cards then
    for _, v in ipairs(context.removed or {}) do
      G.GAME.paperback.destroyed_cards = G.GAME.paperback.destroyed_cards + 1
      G.GAME.paperback.round.destroyed_cards_this_round = G.GAME.paperback.round.destroyed_cards_this_round + 1

      -- Counting destroyed ranks
      if PB_UTIL.is_rank(v, "King") then
        G.GAME.paperback.destroyed_kings = G.GAME.paperback.destroyed_kings + 1
      end
      if PB_UTIL.is_rank(v, "Jack") then
        G.GAME.paperback.destroyed_jacks = G.GAME.paperback.destroyed_jacks + 1
      end
      
      -- Count the amount of destroyed glass cards
      if SMODS.has_enhancement(v, 'm_glass') then
        G.GAME.paperback.destroyed_glass = G.GAME.paperback.destroyed_glass + 1
      end

      -- Count the amount of destroyed face cards
      if v:is_face() then
        G.GAME.paperback.destroyed_faces = G.GAME.paperback.destroyed_faces + 1
      end

      -- Count the amount of destroyed dark suits
      if PB_UTIL.is_suit(v, 'dark', false, true) then
        G.GAME.paperback.destroyed_dark_suits = G.GAME.paperback.destroyed_dark_suits + 1
      end

      -- Count the amount of destroyed light suits
      if PB_UTIL.is_suit(v, 'light', false, true) then
        G.GAME.paperback.destroyed_light_suits = G.GAME.paperback.destroyed_light_suits + 1
      end

      -- Count the amount of destroyed crowns
      if v:is_suit('paperback_Crowns') then
        G.GAME.paperback.destroyed_crowns = G.GAME.paperback.destroyed_crowns + 1
      end

      -- Count the amount of destroyed stars
      if v:is_suit('paperback_Stars') then
        G.GAME.paperback.destroyed_stars = G.GAME.paperback.destroyed_stars + 1
      end

      -- Power Surge unlock
      if PB_UTIL.is_rank(v, 7) and SMODS.has_enhancement(v, 'm_steel') then
        check_for_unlock({ type = 'paperback_destroyed_steel_7' })
      end

      -- The Mind Electric unlock
      if SMODS.has_enhancement(v, 'm_mult') then
        check_for_unlock({ type = 'paperback_destroyed_mult' })
      end
    end
    check_for_unlock({ type = 'paperback_removed_playing_cards' })
  end

  if context.end_of_round then
    if context.game_over == false then
      if context.beat_boss then
        if G.GAME.paperback.num_discards_this_ante == 0 then
          check_for_unlock({ type = 'paperback_no_ante_discard' })
        end
        G.GAME.paperback.num_discards_this_ante = 0
      end

      if G.GAME.current_round.discards_left == G.GAME.round_resets.discards then
        G.GAME.paperback.consecutive_rounds_played_without_discards = G.GAME.paperback.consecutive_rounds_played_without_discards + 1
        if G.GAME.paperback.consecutive_rounds_played_without_discards >= 5 then
          check_for_unlock({ type = 'paperback_five_rounds_no_discards' })
        end
      end

      if not G.GAME.modifiers.no_interest and not next(SMODS.find_card('j_paperback_better_call_jimbo', false)) then
        if G.GAME.interest_amount*math.min(math.floor(G.GAME.dollars/5), G.GAME.interest_cap/5) >= 20 then check_for_unlock({ type = 'paperback_angel_investor_interest' }) end
      end
    end
    if context.game_over then 
      if G.GAME.blind.boss and G.GAME.blind.config.blind.boss.showdown then
        check_for_unlock({ type = 'paperback_lose_to_showdown' })
      end
      if G.GAME.round_resets.ante == 1 then
        check_for_unlock({ type = 'paperback_lose_on_ante_1' })
      end
    end
  end
  
  if context.before then
    -- green clip: gain mult for every other played and scored clip
    local clips_played = PB_UTIL.count_paperclips { area = context.scoring_hand }
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

    -- checks num times hand has been played
    if G.GAME.hands[context.scoring_name].played >= 9 then
      check_for_unlock({ type = 'paperback_hand_played_full_moon' })
    end
    -- checks if played hand contains a pair for Mismatched Sock's and Pear's unlock
    if next(context.poker_hands['Pair']) then
      G.GAME.paperback.played_pair_this_run = true
    end
    if not next(context.poker_hands['Pair']) then
      G.GAME.paperback.only_pairs_this_run = false
    end

    -- checks if played hand contains 5 or more cards for Joker CD-I's unlock
    if #context.full_hand >= 5 then
      G.GAME.paperback.played_5_card_hand = true
    end

    -- check for Spectrum Five
    if PB_UTIL.contains_spectrum(context.poker_hands) and next(context.poker_hands['Five of a Kind']) then
      check_for_unlock({ type = 'paperback_played_spectrum_five' })
    end

    -- Tropic Birds unlock
    G.GAME.paperback.hand_only_scored_aces = true
    -- Jestrica unlock
    G.GAME.paperback.hand_only_scored_8s = true
    G.GAME.paperback.hand_only_scored_light = true
    G.GAME.paperback.hand_only_scored_dark = true
    
    -- Keep Reference Card global variable updated
    PB_UTIL.calculate_highest_shared_played(card)
    
    local all_hearts = true
    local jack_count = 0
    local number_count = 0
    for _, v in ipairs(context.scoring_hand) do
      local id = v:get_id()
      -- handle permabonus odds
      G.GAME.paperback.permabonus_odds = G.GAME.paperback.permabonus_odds + v.ability.perma_paperback_plus_odds
      -- counting face cards
      if v:is_face() then
        G.GAME.paperback.round.scored_face_cards = G.GAME.paperback.round.scored_face_cards + 1
      end
      if not PB_UTIL.is_suit(v, 'dark', false, true) then
        G.GAME.paperback.hand_only_scored_dark = false
      end
      if not PB_UTIL.is_suit(v, 'light', false, true) then
        G.GAME.paperback.hand_only_scored_light = false
      end
      -- Rosary Beads, Technology unlock
      if not (v:is_suit('Hearts') or SMODS.has_any_suit(v)) then
        all_hearts = false
      end
      -- Joker Jacks unlock
      if PB_UTIL.is_rank(v, "Jack") then
        jack_count = jack_count + 1
      end
      -- Spirit Box unlock
      if (2 <= id and id <= 10) then
        number_count = number_count + 1
      end
      -- Penumbra Phantasm unlock
      if PB_UTIL.is_rank(v, "Jack") and v:is_suit('Hearts') then
        G.GAME.paperback.heart_jacks_scored = G.GAME.paperback.heart_jacks_scored + 1
      end
      -- Red Key unlock
      if PB_UTIL.is_rank(v, "King") and v:is_suit('Hearts') then
        G.GAME.paperback.heart_kings_scored = G.GAME.paperback.heart_kings_scored + 1
      end
      -- Tropic Birds unlock
      if not PB_UTIL.is_rank(v, "Ace") then
        G.GAME.paperback.hand_only_scored_aces = false
      end
      -- Jestrica unlock
      if not PB_UTIL.is_rank(v, 8) then
        G.GAME.paperback.hand_only_scored_8s = false
      end
    end

    if G.GAME.paperback.hand_only_scored_dark then
      G.GAME.paperback.played_dark_suit_hands = G.GAME.paperback.played_dark_suit_hands + 1
    end
    if G.GAME.paperback.hand_only_scored_light then
      G.GAME.paperback.played_light_suit_hands = G.GAME.paperback.played_light_suit_hands + 1
    end
    -- Rosary Beads, Technology unlock
    if all_hearts and next(context.poker_hands['Flush Five']) then
      check_for_unlock({ type = 'paperback_played_flush_five_hearts' })
    end
    -- Joker Jacks unlock
    if jack_count >= 3 and next(context.poker_hands['Three of a Kind']) then
      check_for_unlock({ type = 'paperback_played_three_jacks' })
    end
    -- Spirit Box unlock
    if number_count >= 5 and not next(context.poker_hands['Straight']) then
      check_for_unlock({ type = 'paperback_played_five_numbers' })
    end
    -- Penumbra Phantasm unlock
    if G.GAME.paperback.heart_jacks_scored >= 7 then
      check_for_unlock({ type = 'paperback_played_seven_heart_jacks' })
    end
    -- Red Key unlock
    if G.GAME.paperback.heart_kings_scored >= 5 then
      check_for_unlock({ type = 'paperback_played_five_heart_kings' })
    end

    -- checks if played hand contains a flush for the suit drink's unlock
    if next(context.poker_hands['Flush']) then
      for _, card in ipairs(context.scoring_hand) do
        if not SMODS.has_any_suit(card) then
          for suit, count in pairs(SMODS.Suits) do
            if card:is_suit(suit) then
              G.GAME.paperback.played_flushes[suit] = (G.GAME.paperback.played_flushes[suit] and G.GAME.paperback.played_flushes[suit] or 0) + 1
              check_for_unlock({type = 'paperback_suit_flushes'})
              if next(context.poker_hands['Straight']) then
                G.GAME.paperback.played_straight_flushes[suit] = (G.GAME.paperback.played_straight_flushes[suit] and G.GAME.paperback.played_straight_flushes[suit] or 0) + 1
                check_for_unlock({type = 'paperback_suit_straight_flushes'})
              end
              break
            end
          end
          break
        end
      end
    end
    
    for _, v in ipairs(context.full_hand) do
      if not v.paperback_num_times_played then
        v.paperback_num_times_played = 1
      else
        v.paperback_num_times_played = v.paperback_num_times_played + 1
      end
      -- Whitebeard unlock
      if not PB_UTIL.is_rank(v, "Ace") and not PB_UTIL.is_rank(v, "King") then
        G.GAME.paperback.round.played_only_ace_or_king = false
      end
    end
  end

  -- tian tian unlock
  if context.post_trigger then
    if context.other_card.config.center_key == "j_bloodstone" then
      G.GAME.paperback.bloodstone_triggers = G.GAME.paperback.bloodstone_triggers + 1
      if G.GAME.paperback.bloodstone_triggers >= 13 then
        check_for_unlock({type = 'paperback_bloodstone_triggers'})
      end
    end
  end

  if context.open_booster then
    G.GAME.paperback.booster_packs_bought = G.GAME.paperback.booster_packs_bought + 1
    -- Protocol unlock
    if G.GAME.paperback.booster_packs_bought >= 10 then
      check_for_unlock({type = 'paperback_bought_packs'})
    end
   -- Backpack unlock
    if context.card.config.center.kind == "Buffoon" then
      G.GAME.paperback.buffoon_packs_bought = G.GAME.paperback.buffoon_packs_bought + 1
      if G.GAME.paperback.buffoon_packs_bought >= 5 then
        check_for_unlock({type = 'paperback_bought_buffoon_packs'})
      end
    end
  end

  if context.discard then
    if context.other_card == context.full_hand[#context.full_hand] then
      G.GAME.paperback.num_discards_this_ante = G.GAME.paperback.num_discards_this_ante + 1
      if G.GAME.paperback.num_discards_this_ante >= 10 then
        check_for_unlock({type = 'paperback_discarded_10_times'})
      end
    end
    G.GAME.paperback.consecutive_rounds_played_without_discards = 0
    -- green clip: lose mult for each discarded clip
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

  
  if context.using_consumeable then
    local center = context.consumeable.config.center
    local add_new = true
    if center.set == "Tarot" or center.set == "paperback_minor_arcana" then
      -- track Tarot + Minor Arcana usage for 8 of Pentacles
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
    -- track minor arcana usage across runs
    if center.set == "paperback_minor_arcana" then
      PB_UTIL.minor_arcana_profile_usage()
    end
  end
    -- track blind skips across runs
  if context.skip_blind then
    PB_UTIL.blind_skip_profile_usage()
  end

  -- Keep Solar System global variable updated
  if context.paperback and context.paperback.level_up then
    PB_UTIL.update_solar_system(card)
  end

  if context.mod_probability then
    local h_odds = 0
    for i, v in ipairs(G.hand.cards) do
      h_odds = h_odds + v.ability.perma_paperback_h_plus_odds
    end
    return {
      numerator = context.numerator + h_odds + G.GAME.paperback.permabonus_odds
    }
  end
  if context.after then
    G.GAME.paperback.permabonus_odds = 0

    -- Determination unlock
    if SMODS.last_hand_oneshot and G.GAME.current_round.hands_left == 0 then
      check_for_unlock({ type = 'paperback_determination_oneshot' })
    end
    -- Showdown unlock
    if G.GAME.paperback.hand_contained_star and G.GAME.paperback.hand_contained_crown and next(context.poker_hands['Full House']) then
      check_for_unlock({ type = 'paperback_played_star_crown_house' })
    end
  end

  -- add paperclips to shop cards if Illusion is owned
  if context.modify_shop_card and next(SMODS.find_card("v_illusion"))
  and PB_UTIL.config.paperclips_enabled then
    local set = context.card.config.center.set
    if (set == "Default" or set == "Enhanced") and pseudorandom("clip_in_shop") > 0.7 then
      PB_UTIL.set_paperclip(context.card, PB_UTIL.poll_paperclip("clip_in_shop"))
    end
  end

  -- count owned normalJKRs
  if context.starting_shop then
    G.GAME.paperback.free_purchases = #SMODS.find_card("j_paperback_normalJKR", false)
    PB_UTIL.refresh_shop_cost()
  end

  -- subtracts a free purchase if available and used
  if context.buying_card and context.card.cost == 0 and (context.card.ability.set ~= "Voucher" and context.card.ability.set ~= "Booster") then
    G.GAME.paperback.free_purchases = math.max(0, G.GAME.paperback.free_purchases - 1)
    PB_UTIL.refresh_shop_cost()
  end

  -- reset free purchases from normalJKRs (done this way to allow for other forms of stored free purchases)
  if context.ending_shop then
    G.GAME.paperback.free_purchases = math.max(0,
      G.GAME.paperback.free_purchases - #SMODS.find_card("j_paperback_normalJKR", false))
  end

  if context.tag_triggered then
    G.GAME.paperback.tags_redeemed_this_run = G.GAME.paperback.tags_redeemed_this_run + 1
    -- Keycard unlock
    if context.tag_triggered.key == "tag_investment" then
      check_for_unlock({ type = 'paperback_use_investment_tag' })
    end
  end

  if context.final_scoring_step then
    if hand_chips >= 1000 then
      check_for_unlock({ type = 'paperback_hand_scored_1000_chips' })
    end
  end

  if context.playing_card_added then
    G.GAME.paperback.cards_added_to_deck = G.GAME.paperback.cards_added_to_deck + #context.cards
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
  G.GAME.paperback.round.played_face_cards = 0
  G.GAME.paperback.round.ranks_scored = {}
  G.GAME.paperback.round.suits_scored = {}
  G.GAME.paperback.round.destroyed_cards_this_round = 0
  G.GAME.paperback.round.played_only_ace_or_king = true
  G.GAME.paperback.round.scored_face_cards = 0
  G.GAME.paperback.highest_rank_this_round = nil
  G.GAME.paperback.weather_radio_hand = PB_UTIL.get_random_visible_hand('weather_radio')
  G.GAME.paperback.joke_master_hand = PB_UTIL.get_random_visible_hand('joke_master')
  G.GAME.paperback.ponzu_suit = PB_UTIL.choose_new_item(G.GAME.paperback.ponzu_suit or nil, PB_UTIL.base_suits, 'ponzu')
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
    G.GAME.paperback.free_purchases = 0
  end
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

-- Load the rest of the content
SMODS.load_file("utilities/definitions/misc.lua")()
SMODS.load_file("utilities/definitions/deck_skins.lua")()
SMODS.load_file("utilities/definitions/ego_gifts.lua")()
SMODS.load_file("utilities/definitions/paperclips.lua")()
SMODS.load_file("utilities/definitions/suits.lua")()
SMODS.load_file("utilities/definitions/minor_arcana.lua")()
