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
      local destroyed = G.GAME.paperback.destroyed_cards

			destroyed["cards"] = destroyed["cards"] + 1
			G.GAME.paperback.round.destroyed_cards_this_round = G.GAME.paperback.round.destroyed_cards_this_round + 1

			local rank_obj = not v or SMODS.has_no_rank(v) and nil or PB_UTIL.get_rank_from_id(v:get_id())
			local rank = rank_obj and rank_obj.key or "rankless"
			destroyed.ranks[rank] = (destroyed.ranks[rank] or 0) + 1
			if v:is_face() then destroyed.ranks["face"] = (destroyed.ranks["face"] or 0) + 1 end


			local enhancements = SMODS.get_enhancements(v) or {}
			for k, _ in pairs(enhancements) do
				destroyed.enhancements[k] = (destroyed.enhancements[k] or 0) + 1
			end

			if not SMODS.has_no_suit(v) then
				for k, _ in pairs(SMODS.Suits or {}) do
					if v.base.suit == k then
						destroyed.suits[k] = (destroyed.suits[k] or 0) + 1
						if PB_UTIL.is_suit(v, 'light') then
							destroyed.suits["light"] = (destroyed.suits["light"] or 0) + 1
						elseif PB_UTIL.is_suit(v, 'dark') then
							destroyed.suits["dark"] = (destroyed.suits["dark"] or 0) + 1
						end
					end
				end
			else
				destroyed.suits["suitless"] = (destroyed.suits["suitless"] or 0) + 1
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

    -- Keep Reference Card global variable updated
    PB_UTIL.calculate_highest_shared_played()

    for _, v in ipairs(context.scoring_hand) do
      -- handle permabonus odds
      G.GAME.paperback.permabonus_odds = G.GAME.paperback.permabonus_odds + v.ability.perma_paperback_plus_odds
    end
  end

  if context.discard then
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
  end

  -- Keep Solar System global variable updated
  if context.paperback and context.paperback.level_up then
    PB_UTIL.update_solar_system()
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
  G.GAME.paperback.round.played_only_straights = true
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
