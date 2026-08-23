-- Hooks into global calculate to keep unlock conditions organized
local paperback_calculate_ref = SMODS.current_mod.calculate
SMODS.current_mod.calculate = function(self, context)
	paperback_calculate_ref(self, context)

	if context.remove_playing_cards then
		for _, v in ipairs(context.removed or {}) do
			-- Power Surge unlock
			if PB_UTIL.is_rank(v, 7) and SMODS.has_enhancement(v, 'm_steel') then
				check_for_unlock({ type = 'paperback_destroyed_steel_7' })
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
        G.GAME.paperback.money_gained_this_ante = 0
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
		-- Find Jimbo unlock
    G.GAME.paperback.hand_only_scored_jacks = true
    -- Jestrica unlock
    G.GAME.paperback.hand_only_scored_8s = true
    G.GAME.paperback.hand_only_scored_light = true
    G.GAME.paperback.hand_only_scored_dark = true
    -- reset counter for checking broken bandage cards
    G.GAME.paperback.num_bandages_broken_last_hand = 0
    
    
    local all_hearts = true
    local all_4s = true
    local jack_count = 0
    local number_count = 0
    local light_count = 0
    local dark_count = 0
    for _, v in ipairs(context.scoring_hand) do
      local id = v:get_id()
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
      if PB_UTIL.is_suit(v, 'dark', false, true) then
        dark_count = dark_count + 1
      end
      if PB_UTIL.is_suit(v, 'light', false, true) then
        light_count = light_count + 1
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
			-- Tropic Birds unlock
      if not PB_UTIL.is_rank(v, "Jack") then
        G.GAME.paperback.hand_only_scored_jacks = false
      end
      -- Jestrica unlock
      if not PB_UTIL.is_rank(v, 8) then
        G.GAME.paperback.hand_only_scored_8s = false
      end
      -- Master Spark unlock
      if not PB_UTIL.is_rank(v, 4) then
        all_4s = false
      end
      -- Deck of Cards unlock
      if SMODS.has_enhancement(v, 'm_paperback_antique') and context.scoring_name == 'High Card' then
        check_for_unlock({ type = 'paperback_high_card_antique' })
      end
    end

    if G.GAME.paperback.hand_only_scored_dark then
      G.GAME.paperback.played_dark_suit_hands = G.GAME.paperback.played_dark_suit_hands + 1
    end
    if G.GAME.paperback.hand_only_scored_light then
      G.GAME.paperback.played_light_suit_hands = G.GAME.paperback.played_light_suit_hands + 1
    end
    -- Rosary Beads, Technology unlock
    if all_hearts and context.scoring_name == 'Flush Five' then
      check_for_unlock({ type = 'paperback_played_flush_five_hearts' })
    end
    -- Joker Jacks unlock
    if jack_count >= 3 and context.scoring_name == 'Three of a Kind' then
      check_for_unlock({ type = 'paperback_played_three_jacks' })
    end
    -- Spirit Box unlock
    if number_count >= 5 and not next(context.poker_hands['Straight']) then
      check_for_unlock({ type = 'paperback_played_five_numbers' })
    end
    -- Master Spark unlock
    if all_4s and context.scoring_name == 'Four of a Kind' then
      check_for_unlock({ type = 'paperback_4oak_4s' })
    end
    -- Penumbra Phantasm unlock
    if G.GAME.paperback.heart_jacks_scored >= 7 then
      check_for_unlock({ type = 'paperback_played_seven_heart_jacks' })
    end
    -- Red Key unlock
    if G.GAME.paperback.heart_kings_scored >= 5 then
      check_for_unlock({ type = 'paperback_played_five_heart_kings' })
    end
    -- & unlock
    if light_count >= 2 and dark_count >= 2 and context.scoring_name == 'Two Pair' then
      check_for_unlock({ type = 'paperback_two_pair_light_dark' })
    end
    -- Spotty Joker unlock
    if not next(context.poker_hands['Straight']) then
      G.GAME.paperback.round.played_only_straights = false
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
      v.paperback_num_times_played = (v.paperback_num_times_played or 0) + 1
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
	end

	if context.using_consumeable then
		-- track minor arcana usage across runs
    if context.consumeable.config.center.set == "paperback_minor_arcana" then
      G.PROFILES[G.SETTINGS.profile].career_stats.paperback_minor_arcana_used = (G.PROFILES[G.SETTINGS.profile].career_stats.paperback_minor_arcana_used or 0) + 1
			check_for_unlock({type = 'paperback_use_minor_arcana', minor_arcana_total = G.PROFILES[G.SETTINGS.profile].career_stats.paperback_minor_arcana_used})
    end
	end

	if context.skip_blind then
		G.PROFILES[G.SETTINGS.profile].career_stats.paperback_blind_skips = (G.PROFILES[G.SETTINGS.profile].career_stats.paperback_blind_skips or 0) + 1
		check_for_unlock({type = 'paperback_skip_blind', blind_skips_total = G.PROFILES[G.SETTINGS.profile].career_stats.paperback_blind_skips})
	end

	if context.after then
		-- Determination unlock
    if SMODS.last_hand_oneshot and G.GAME.current_round.hands_left == 0 then
      check_for_unlock({ type = 'paperback_determination_oneshot' })
    end
    -- Showdown unlock
    if G.GAME.paperback.hand_contained_star and G.GAME.paperback.hand_contained_crown and context.scoring_name == 'Full House' then
      check_for_unlock({ type = 'paperback_played_star_crown_house' })
    end
    -- Towering Pillar of Hats unlock
    if G.GAME.paperback.hand_contained_star and G.GAME.paperback.hand_contained_crown and context.scoring_name == 'Three of a Kind' then
      check_for_unlock({ type = 'paperback_played_star_crown_3oak' })
    end
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

  if context.money_altered then
    G.GAME.paperback.money_gained_this_ante = G.GAME.paperback.money_gained_this_ante + math.max(0, context.amount)
    G.GAME.paperback.highest_amount_of_money_had = math.max(G.GAME.paperback.highest_amount_of_money_had, (G.GAME.dollars + (G.GAME.dollar_buffer or 0)))
  end

  if context.modify_final_cashout then
    -- Better Call Jimbo unlock
    if context.amount >= 25 then check_for_unlock({ type = 'paperback_25_dollar_cashout' }) end
  end

  if context.press_play then
    -- Ddakji unlock
    local count = 0
    for _, v in ipairs(G.hand.highlighted) do
      if v.facing == 'back' then count = count + 1 end
    end
    if count >= 5 then check_for_unlock({ type = 'paperback_5_face_down_cards' }) end
  end
end