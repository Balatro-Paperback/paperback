PB_UTIL.ENABLED_EGO_GIFTS = {
  'imposed_weight',
  'phlebotomy_pack',
  'smokes_and_wires',
  "red_tassle",
  'coffee_and_cranes',
  'fiery_down',
  'decamillennial_stewpot',
  "tango_marinade",
  'downpour',
  'rusty_coin',
  'ragged_umbrella',
  "canned_ice_cream",
  'thrill',
  'disk_fragment',
  'death_seeker',
  "hardwood_liquor_cup",
  'pendant_of_nostalgia',
  'blue_lighter',
  'broken_glasses',
  "snuffed_candlestick",
  'nebulizer',
  'tomorrow_fortune',
  'fluorescent_lamp',
  "vestiges_of_the_king",
  'lightning_rod',
  'chalice_of_trickle_down',
  'patrolling_flashlight',
  "prestige_card",
  'golden_bough',
  'dark_vestige',
}
PB_UTIL.ENABLED_EGO_GIFT_BOOSTERS = {
  'ego_gift_normal_1',
}
if PB_UTIL.config.ego_gifts_enabled then
  -- Sin object for debuffs
  -- TODO: Make debuffs actual objects for ease of cross-mod and more intuitive handling
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
    paperback_credit = {
      artist = { 'papermoonqueen', 'ari' },
      coder = { 'dowfrin' }
    },

    in_pool = function(self, args)
      return not PB_UTIL.create_card_in_consumable_area
    end,

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
          G.PROFILES[G.SETTINGS.profile].paperback_sold_ego_gifts = (G.PROFILES[G.SETTINGS.profile].paperback_sold_ego_gifts or 0) +
              1
          G:save_settings()
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
        SMODS.add_card { key = 'c_paperback_dark_vestige' }
        card.paperback_no_destroy_calc = true
        SMODS.destroy_cards(card)
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
