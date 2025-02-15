-- Initialize Food pool if not existing, which may be created by other mods.
-- Any joker can add itself to this pool by adding a pools table to its definition
-- Credits to Cryptid for the idea
if not SMODS.ObjectTypes.Food then
  SMODS.ObjectType {
    key = 'Food',
    default = 'j_egg',
    cards = {},
    inject = function(self)
      SMODS.ObjectType.inject(self)
      -- Insert base game food jokers
      self:inject_card(G.P_CENTERS.j_gros_michel)
      self:inject_card(G.P_CENTERS.j_egg)
      self:inject_card(G.P_CENTERS.j_ice_cream)
      self:inject_card(G.P_CENTERS.j_cavendish)
      self:inject_card(G.P_CENTERS.j_turtle_bean)
      self:inject_card(G.P_CENTERS.j_diet_cola)
      self:inject_card(G.P_CENTERS.j_popcorn)
      self:inject_card(G.P_CENTERS.j_ramen)
      self:inject_card(G.P_CENTERS.j_selzer)
    end
  }
end

-- Checks if a string is a valid paperclip key
function PB_UTIL.is_paperclip(str)
  for _, v in ipairs(PB_UTIL.ENABLED_PAPERCLIPS) do
    if 'paperback_' .. v == str then
      return true
    end
  end
end

-- If found, the first value returned is the key, the second
-- is the config table of this clip
function PB_UTIL.has_paperclip(card)
  for k, v in pairs(card and card.ability or {}) do
    if PB_UTIL.is_paperclip(k) then
      return k, v
    end
  end
end

-- A playing card can only have one paperclip
--- @param type "blue"
function PB_UTIL.set_paperclip(card, type)
  local key = 'paperback_' .. type .. '_clip'

  if card and PB_UTIL.is_paperclip(key) then
    -- Remove all paperclips in this card before applying
    for k, _ in pairs(card.ability) do
      if PB_UTIL.is_paperclip(k) then
        card.ability[k] = nil
      end
    end

    SMODS.Stickers[key]:apply(card, true)
  end
end

function PB_UTIL.is_food(card)
  -- Accepts a key, a center or a card
  local key = (type(card) == "string" and card) or (card.key and card.key) or card.config.center_key

  if key then
    for _, v in ipairs(G.P_CENTER_POOLS.Food) do
      if v.key == key then return true end
    end
  end
end

-- Gets all the food jokers in the G.jokers card area
function PB_UTIL.get_owned_food()
  local res = {}

  if G.jokers then
    for _, v in ipairs(G.jokers.cards) do
      if PB_UTIL.is_food(v) then
        res[#res + 1] = v
      end
    end
  end

  return res
end

-- Register a list of items in custom order
function PB_UTIL.register_items(items, path)
  for i = 1, #items do
    local status, err = pcall(function()
      return NFS.load(SMODS.current_mod.path .. "/" .. path .. "/" .. items[i] .. ".lua")()
    end)
    sendDebugMessage("Loaded item " .. path .. ":" .. items[i], "Paperback")

    -- If a file didn't load correctly, display the file in question and return
    if not status then
      error(items[i] .. ": " .. err)
    end
  end
end

-- Registers a DeckSkin set
function PB_UTIL.register_deckskin_set(suits, ranks, filename, descriptions)
  local atlas_hc = SMODS.Atlas {
    key = filename .. "_hc",
    path = filename .. "_hc.png",
    px = 71,
    py = 95,
  }

  local atlas_lc = SMODS.Atlas {
    key = filename .. "_lc",
    path = filename .. "_lc.png",
    px = 71,
    py = 95,
  }

  for i, suit in ipairs(suits) do
    SMODS.DeckSkin {
      key = filename .. "_" .. suit .. "_skin",
      suit = suit:gsub("^%l", string.upper),
      loc_txt = {
        ['en-us'] = descriptions[i]
      },
      palettes = {
        {
          key = 'lc',
          ranks = ranks,
          display_ranks = PB_UTIL.reverse_table(ranks),
          atlas = atlas_lc.key,
          pos_style = 'deck',
        },
        {
          key = 'hc',
          ranks = ranks,
          display_ranks = PB_UTIL.reverse_table(ranks),
          atlas = atlas_hc.key,
          pos_style = 'deck',
        }
      },
    }
  end
end

function PB_UTIL.reverse_table(t)
  local reversed = {}
  for i = #t, 1, -1 do
    table.insert(reversed, t[i])
  end
  return reversed
end

function PB_UTIL.get_complete_suits(vanilla_ranks)
  if not G.playing_cards then return 0 end

  local deck = {}
  local amount = 0

  for k, v in ipairs(G.playing_cards) do
    if not SMODS.has_no_suit(v) then
      deck[v.base.suit] = deck[v.base.suit] or {}
      deck[v.base.suit][v.base.value] = true
    end
  end

  for _, deck_ranks in pairs(deck) do
    local res = true

    for k, v in pairs(vanilla_ranks and PB_UTIL.base_ranks or SMODS.Ranks) do
      if not deck_ranks[vanilla_ranks and v or k] then
        res = false
      end
    end

    amount = amount + (res and 1 or 0)
  end

  return amount
end

function PB_UTIL.modify_sell_value(card, amount)
  if not card.set_cost or amount == 0 then return end

  if card.ability.custom_sell_cost then
    card.ability.custom_sell_cost_increase = amount
  else
    card.ability.extra_value = (card.ability.extra_value or 0) + amount
  end

  card:set_cost()
end

function PB_UTIL.calculate_stick_xMult(card)
  local xMult = card.ability.extra.xMult

  -- Only calculate the xMult if the G.jokers cardarea exists
  if G.jokers and G.jokers.cards then
    for k, current_card in pairs(G.jokers.cards) do
      if current_card ~= card and string.match(string.lower(current_card.ability.name), "%f[%w]stick%f[%W]") then
        xMult = xMult + card.ability.extra.xMult
      end
    end
  end

  return xMult
end

-- Gets the number of unique suits in a scoring hand
function PB_UTIL.get_unique_suits(scoring_hand)
  -- Initialize the suits table
  local suits = {}

  for k, v in pairs(SMODS.Suits) do
    suits[k] = 0
  end

  -- Check for unique suits in scoring_hand
  for i = 1, #scoring_hand do
    local scoring_card = scoring_hand[i]

    for scoring_suit, _ in pairs(suits) do
      if suits[scoring_suit] == 0 and scoring_card:is_suit(scoring_suit, true) then
        suits[scoring_suit] = 1

        -- Stop checking other suits if it's a Wild Card
        if scoring_card.ability.name == 'Wild Card' then
          break
        end
      end
    end
  end

  local unique_suits = 0

  for _, v in pairs(suits) do
    unique_suits = unique_suits + v
  end

  return unique_suits
end

function PB_UTIL.is_in_your_collection(card)
  if not G.your_collection then return false end
  for i = 1, 3 do
    if (G.your_collection[i] and card.area == G.your_collection[i]) then return true end
  end
  return false
end

-- Adds a booster pack with the specified key to the shop
-- Does nothing if the shop doesn't exist
function PB_UTIL.add_booster_pack(key, price)
  if not G.shop then return end

  -- Create the pack the same way vanilla game does it
  local pack = Card(
    G.shop_booster.T.x + G.shop_booster.T.w / 2,
    G.shop_booster.T.y,
    G.CARD_W * 1.27, G.CARD_H * 1.27,
    G.P_CARDS.empty,
    G.P_CENTERS[key],
    { bypass_discovery_center = true, bypass_discovery_ui = true }
  )

  if price then
    pack.cost = price
  end

  -- Create the price tag above the pack
  create_shop_card_ui(pack, 'Booster', G.shop_booster)

  -- Add the pack to the shop
  pack:start_materialize()
  G.shop_booster:emplace(pack)
end

-- Gets a pseudorandom tag from the Tag pool
function PB_UTIL.poll_tag(seed)
  -- This part is basically a copy of how the base game does it
  -- Look at get_next_tag_key in common_events.lua
  local pool = get_current_pool('Tag')
  local tag_key = pseudorandom_element(pool, pseudoseed(seed))

  while tag_key == 'UNAVAILABLE' do
    tag_key = pseudorandom_element(pool, pseudoseed(seed))
  end

  local tag = Tag(tag_key)

  -- The way the hand for an orbital tag in the base game is selected could cause issues
  -- with mods that modify blinds, so we randomly pick one from all visible hands
  if tag_key == "tag_orbital" then
    local available_hands = {}

    for k, hand in pairs(G.GAME.hands) do
      if hand.visible then
        available_hands[#available_hands + 1] = k
      end
    end

    tag.ability.orbital_hand = pseudorandom_element(available_hands, pseudoseed(seed .. '_orbital'))
  end

  return tag
end

-- Gets a psuedorandom consumable from the Consumables pool (Soul and Black Hole included)
function PB_UTIL.poll_consumable(seed, soulable)
  local types = {}

  for k, v in pairs(SMODS.ConsumableTypes) do
    types[#types + 1] = k
  end

  return SMODS.create_card {
    set = pseudorandom_element(types, pseudoseed(seed)),
    area = G.consumables,
    soulable = soulable,
    key_append = seed,
  }
end

-- This is used for jokers that need to destroy cards outside
-- of the "destroy_card" context
function PB_UTIL.destroy_playing_cards(destroyed_cards, card, effects)
  G.E_MANAGER:add_event(Event({
    func = function()
      -- Show a message on the card at the same time the playing cards are
      -- being destroyed
      if #destroyed_cards > 0 and type(effects) == 'table' then
        effects.sound = 'tarot1'
        effects.instant = true
        SMODS.calculate_effect(effects, card)
      end

      -- Destroy every card
      for _, v in ipairs(destroyed_cards) do
        if SMODS.shatters(v) then
          v:shatter()
        else
          v:start_dissolve()
        end
      end

      G.E_MANAGER:add_event(Event {
        func = function()
          SMODS.calculate_context({
            remove_playing_cards = true,
            removed = destroyed_cards
          })
          return true
        end
      })

      return true
    end
  }))

  -- Mark the cards as destroyed
  for _, v in ipairs(destroyed_cards) do
    if SMODS.shatters(v) then
      v.shattered = true
    else
      v.destroyed = true
    end
  end
end

function PB_UTIL.destroy_joker(card, after)
  G.E_MANAGER:add_event(Event({
    func = function()
      play_sound('tarot1')
      card.T.r = -0.2
      card:juice_up(0.3, 0.4)
      card.states.drag.is = true
      card.children.center.pinch.x = true
      G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.3,
        blockable = false,
        func = function()
          G.jokers:remove_card(card)
          card:remove()

          if after and type(after) == "function" then
            after()
          end

          return true
        end
      }))
      return true
    end
  }))
end

-- This function is basically a copy of how the base game does the flipping
-- animation on playing cards when using a consumable that modifies them
function PB_UTIL.use_consumable_animation(card, cards_to_flip, action)
  -- If it's not a list, make it one
  if cards_to_flip and not cards_to_flip[1] then
    cards_to_flip = { cards_to_flip }
  end

  G.E_MANAGER:add_event(Event {
    trigger = 'after',
    delay = 0.4,
    func = function()
      play_sound('tarot1')
      card:juice_up(0.3, 0.5)
      return true
    end
  })

  if cards_to_flip then
    for i = 1, #cards_to_flip do
      local c = cards_to_flip[i]
      local percent = 1.15 - (i - 0.999) / (#cards_to_flip - 0.998) * 0.3

      G.E_MANAGER:add_event(Event {
        trigger = 'after',
        delay = 0.15,
        func = function()
          c:flip()
          play_sound('card1', percent)
          c:juice_up(0.3, 0.3)
          return true
        end
      })
    end

    delay(0.2)
  end

  G.E_MANAGER:add_event(Event {
    trigger = 'after',
    delay = '0.1',
    func = function()
      if action and type(action) == "function" then
        action()
      end
      return true
    end
  })

  if cards_to_flip then
    for i = 1, #cards_to_flip do
      local c = cards_to_flip[i]
      local percent = 0.85 + (i - 0.999) / (#cards_to_flip - 0.998) * 0.3

      G.E_MANAGER:add_event(Event {
        trigger = 'after',
        delay = 0.15,
        func = function()
          c:flip()
          play_sound('tarot2', percent, 0.6)
          c:juice_up(0.3, 0.3)
          return true
        end
      })
    end
  end

  G.E_MANAGER:add_event(Event {
    trigger = 'after',
    delay = 0.2,
    func = function()
      G.hand:unhighlight_all()
      return true
    end
  })

  if cards_to_flip then
    delay(0.5)
  end
end

-- Gets a sorted list of all ranks in descending order
function PB_UTIL.get_sorted_ranks()
  local ranks = {}

  for k, v in pairs(SMODS.Ranks) do
    ranks[#ranks + 1] = v
  end

  table.sort(ranks, function(a, b)
    return a.sort_nominal > b.sort_nominal
  end)

  return ranks
end

function PB_UTIL.get_rank_from_id(id)
  for k, v in pairs(SMODS.Ranks) do
    if v.id == id then return v end
  end
end

-- Returns whether the first rank is higher than the second
function PB_UTIL.compare_ranks(rank1, rank2, allow_equal)
  if type(rank1) ~= "table" then
    rank1 = PB_UTIL.get_rank_from_id(rank1)
  end

  if type(rank2) ~= "table" then
    rank2 = PB_UTIL.get_rank_from_id(rank2)
  end

  local comp = function(a, b)
    return allow_equal and (a >= b) or (a > b)
  end

  return comp(rank1.sort_nominal, rank2.sort_nominal)
end

-- Used to check whether a card is a light or dark suit
--- @param type 'light' | 'dark'
function PB_UTIL.is_suit(card, type)
  for _, v in ipairs(type == 'light' and PB_UTIL.light_suits or PB_UTIL.dark_suits) do
    if card:is_suit(v) then return true end
  end
end

function PB_UTIL.has_suit_in_deck(suit, ignore_wild)
  for _, v in ipairs(G.playing_cards or {}) do
    if not SMODS.has_no_suit(v) and (v.base.suit == suit or (not ignore_wild and v:is_suit(suit))) then
      return true
    end
  end
end
