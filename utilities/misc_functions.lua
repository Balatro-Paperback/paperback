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

---Checks if a string is a valid paperclip key
---@param str string
---@return boolean
function PB_UTIL.is_paperclip(str)
  for _, v in ipairs(PB_UTIL.ENABLED_PAPERCLIPS) do
    if 'paperback_' .. v == str then
      return true
    end
  end
  return false
end

---Checks if a card has a paperclip. If found, the first value returned is the key.
---The second value returned is the config table of the supplied paperclip.
---Returns nil if no paperclip is on the card.
---@param card table
---@return string | nil
---@return table | nil
function PB_UTIL.has_paperclip(card)
  for k, v in pairs(card and card.ability or {}) do
    if PB_UTIL.is_paperclip(k) then
      return k, v
    end
  end
end

--- Counts all the paperclips in the specified area and returns the count
--- @param args { area: table, allow_debuff: boolean?, exclude_highlighted: boolean? }
--- @return integer
function PB_UTIL.count_paperclips(args)
  local clips = 0

  for _, v in ipairs(args.area and args.area.cards or {}) do
    local debuff_check = args.allow_debuff or not v.debuff
    local highlighted_check = not args.exclude_highlighted or not v.highlighted

    if PB_UTIL.has_paperclip(v) and debuff_check and highlighted_check then
      clips = clips + 1
    end
  end

  return clips
end

--- Removes all paperclip keys from this card
---@param card table
function PB_UTIL.remove_paperclip(card)
  for k, _ in pairs(card and card.ability or {}) do
    if PB_UTIL.is_paperclip(k) then
      card.ability[k] = nil
    end
  end
end

---Applies a paperclip with provided type to the provided card.
---A playing card can only have a single paperclip.
---@param card table
---@param type Paperclip
function PB_UTIL.set_paperclip(card, type)
  local key = 'paperback_' .. type .. '_clip'

  if card and PB_UTIL.is_paperclip(key) then
    PB_UTIL.remove_paperclip(card)
    SMODS.Stickers[key]:apply(card, true)
  end
end

---Checks if a provided card is classified as a "Food Joker"
---@param card table | string a center key or a card
---@return boolean
function PB_UTIL.is_food(card)
  local center

  if type(card) == "string" then
    center = G.P_CENTERS[card]
  else
    center = card.config and card.config.center
  end

  return center and center.pools and center.pools.Food
end

---Returns a table of all the Jokers classified as "Food Jokers" in the G.jokers cardarea
---@return table
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

---Registers a list of items in a custom order
---@param items table
---@param path string
function PB_UTIL.register_items(items, path)
  for i = 1, #items do
    SMODS.load_file(path .. "/" .. items[i] .. ".lua")()
  end
end

---Reverses a provided table
---@param t table
---@return table
function PB_UTIL.reverse_table(t)
  local reversed = {}
  for i = #t, 1, -1 do
    table.insert(reversed, t[i])
  end
  return reversed
end

---Gets the number of complete suits that the user has in their deck
---@param vanilla_ranks boolean
---@return integer
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

---Modifies the sell value of a provided card by the provided amount
---@param card table
---@param amount integer
function PB_UTIL.modify_sell_value(card, amount)
  if not card.set_cost or amount == 0 then return end

  if card.ability.custom_sell_cost then
    card.ability.custom_sell_cost_increase = amount
  else
    card.ability.extra_value = (card.ability.extra_value or 0) + amount
  end

  card:set_cost()
end

---Calculates the xMult provided by the supplied Stick Joker (card)
---@param card table
---@return number
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

---Gets the number of unique suits in a provided scoring hand
---@param scoring_hand table
---@param bypass_debuff boolean?
---@param flush_calc boolean?
---@return integer
function PB_UTIL.get_unique_suits(scoring_hand, bypass_debuff, flush_calc)
  -- Set each suit's count to 0
  local suits = {}

  for k, _ in pairs(SMODS.Suits) do
    suits[k] = 0
  end

  -- First we cover all the non Wild Cards in the hand
  for _, card in ipairs(scoring_hand) do
    if not SMODS.has_any_suit(card) then
      for suit, count in pairs(suits) do
        if card:is_suit(suit, bypass_debuff, flush_calc) and count == 0 then
          suits[suit] = count + 1
          break
        end
      end
    end
  end

  -- Then we cover Wild Cards, filling the missing suits
  for _, card in ipairs(scoring_hand) do
    if SMODS.has_any_suit(card) then
      for suit, count in pairs(suits) do
        if card:is_suit(suit, bypass_debuff, flush_calc) and count == 0 then
          suits[suit] = count + 1
          break
        end
      end
    end
  end

  -- Count the amount of suits that were found
  local num_suits = 0

  for _, v in pairs(suits) do
    if v > 0 then num_suits = num_suits + 1 end
  end

  return num_suits
end

--- Creates and opens the specified booster pack, the same way a Tag would do it
--- @param key string
function PB_UTIL.open_booster_pack(key)
  local pack = Card(
    G.play.T.x + G.play.T.w / 2 - G.CARD_W * 1.27 / 2,
    G.play.T.y + G.play.T.h / 2 - G.CARD_H * 1.27 / 2,
    G.CARD_W * 1.27, G.CARD_H * 1.27, G.P_CARDS.empty,
    G.P_CENTERS[key],
    { bypass_discovery_center = true, bypass_discovery_ui = true }
  )

  pack.cost = 0
  pack.from_tag = true

  G.FUNCS.use_card { config = { ref_table = pack } }
  pack:start_materialize()
end

---Adds a booster pack with the specified key to the shop.
---Does nothing if the shop does not exist
---@param key string
---@param price number?
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

---Gets a pseudorandom tag from the Tag pool
---@param seed string
---@param options table? a list of tags to choose from, defaults to normal pool
---@return table
function PB_UTIL.poll_tag(seed, options)
  -- This part is basically a copy of how the base game does it
  -- Look at get_next_tag_key in common_events.lua
  local pool = options or get_current_pool('Tag')
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

--- Adds a tag the same way vanilla does it
--- @param tag string | table a tag key or a tag table
--- @param event boolean? whether to send this in an event or not
function PB_UTIL.add_tag(tag, event)
  local func = function()
    add_tag(type(tag) == 'string' and Tag(tag) or tag)
    play_sound('generic1', 0.9 + math.random() * 0.1, 0.8)
    play_sound('holo1', 1.2 + math.random() * 0.1, 0.4)
    return true
  end

  if event then
    G.E_MANAGER:add_event(Event {
      func = func
    })
  else
    func()
  end
end

---Gets a pseudorandom consumable from the Consumables pool (Soul and Black Hole included)
---@param seed string
---@param soulable boolean
---@return table
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

--- Tries to spawn a card into either the Jokers or Consumeable card areas, ensuring
--- that there is space available.
--- DOES NOT TAKE INTO ACCOUNT ANY OTHER AREAS
--- @param args table same arguments passed to SMODS.create_card, with the addition of 'instant' and 'func'
function PB_UTIL.try_spawn_card(args)
  local is_joker = (args.set == 'Joker' or args.key and args.key:sub(1, 1) == 'j')
  local area = args.area or (is_joker and G.jokers) or G.consumeables
  local buffer = area == G.jokers and 'joker_buffer' or 'consumeable_buffer'

  if #area.cards + G.GAME[buffer] < area.config.card_limit then
    if args.instant then
      SMODS.add_card(args)
    else
      G.GAME[buffer] = G.GAME[buffer] + 1

      G.E_MANAGER:add_event(Event {
        func = function()
          SMODS.add_card(args)
          G.GAME[buffer] = 0
          return true
        end
      })
    end

    if args.func and type(args.func) == "function" then
      args.func()
    end
  end
end

---This is used for Jokers that need to destroy cards outside of the "destroy_card" context
---@param destroyed_cards table
---@param card table?
---@param effects table?
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

---Destroys the provided Joker
---@param card table
---@param after function?
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

---This function is basically a copy of how the base game does the flipping animation
---on playing cards when using a consumable that modifies them
---@param card table
---@param cards_to_flip table?
---@param action function?
---@param sound string?
function PB_UTIL.use_consumable_animation(card, cards_to_flip, action, sound)
  -- If it's not a list, make it one
  if cards_to_flip and not cards_to_flip[1] then
    cards_to_flip = { cards_to_flip }
  end

  G.E_MANAGER:add_event(Event {
    trigger = 'after',
    delay = 0.4,
    func = function()
      play_sound(sound or 'tarot1')
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

--- Shows the "Nope!" text that Wheel of Fortune does when failing on top of a card
--- @param card table
--- @param color table? the color of the square that pops up, defaults to Tarot
function PB_UTIL.show_nope_text(card, color)
  -- This is all a copy of how the base game does it
  G.E_MANAGER:add_event(Event({
    trigger = 'after',
    delay = 0.4,
    func = function()
      local booster = G.STATE == G.STATES.TAROT_PACK
          or G.STATE == G.STATES.SPECTRAL_PACK
          or G.STATE == G.STATES.SMODS_BOOSTER_OPENED

      attention_text({
        text = localize('k_nope_ex'),
        scale = 1.3,
        hold = 1.4,
        major = card,
        backdrop_colour = color or G.C.SECONDARY_SET.Tarot,
        align = booster and 'tm' or 'cm',
        offset = {
          x = 0,
          y = booster and -0.2 or 0
        },
        silent = true
      })

      G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.06 * G.SETTINGS.GAMESPEED,
        blockable = false,
        blocking = false,
        func = function()
          play_sound('tarot2', 0.76, 0.4)
          return true
        end
      }))

      play_sound('tarot2', 1, 0.4)
      card:juice_up(0.3, 0.5)
      return true
    end
  }))
end

--- Returns hands or discards, whichever is lower
--- @return { hands: boolean?, discards: boolean?, amt: integer }
function PB_UTIL.get_lowest_hand_discard()
  if not G.GAME then return { amt = 0 } end

  local hands = G.GAME.current_round.hands_left
  local discards = G.GAME.current_round.discards_left

  if hands == discards then
    return { amt = hands, discards = true, hands = true }
  elseif hands < discards then
    return { amt = hands, hands = true }
  else
    return { amt = discards, discards = true }
  end
end

--- Returns a list of visible hands, ordered by most played to least
--- @return {key: string, hand: table, planet_key: string}[]
function PB_UTIL.get_most_played_hands()
  local hands = {}

  for _, v in ipairs(G.P_CENTER_POOLS.Planet) do
    if v.config and v.config.hand_type then
      local hand = G.GAME.hands[v.config.hand_type]

      if hand and hand.visible then
        hands[#hands + 1] = {
          key = v.config.hand_type,
          hand = hand,
          planet_key = v.key
        }
      end
    end
  end

  table.sort(hands, function(a, b)
    if a.hand.played ~= b.hand.played then
      return a.hand.played > b.hand.played
    end

    -- Sort by base values if the played amount is equal
    return (a.hand.s_mult * a.hand.s_chips) > (b.hand.s_mult * b.hand.s_chips)
  end)

  return hands
end

---Gets a sorted list of all ranks in descending order
---@return table
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

---Gets a rank's string value from a supplied id
---@param id integer
---@return table | nil
function PB_UTIL.get_rank_from_id(id)
  for k, v in pairs(SMODS.Ranks) do
    if v.id == id then return v end
  end

  return nil
end

---Returns whether the first rank is higher than the second
---@param rank1 table | integer
---@param rank2 table | integer
---@param allow_equal? boolean
---@return boolean
function PB_UTIL.compare_ranks(rank1, rank2, allow_equal)
  if type(rank1) ~= "table" then
    local result = PB_UTIL.get_rank_from_id(rank1)

    if result then
      rank1 = result
    end
  end

  if type(rank2) ~= "table" then
    local result = PB_UTIL.get_rank_from_id(rank2)

    if result then
      rank2 = result
    end
  end

  local comp = function(a, b)
    return allow_equal and (a >= b) or (a > b)
  end

  return comp(rank1.sort_nominal, rank2.sort_nominal)
end

---Used to check whether a card is a light or dark suit
---@param card table
---@param type 'light' | 'dark'
---@return boolean
function PB_UTIL.is_suit(card, type)
  for _, v in ipairs(type == 'light' and PB_UTIL.light_suits or PB_UTIL.dark_suits) do
    if card:is_suit(v) then return true end
  end
  return false
end

---Checks if the provided suit is currently in the deck
---@param suit string
---@param ignore_wild? boolean
---@return boolean
function PB_UTIL.has_suit_in_deck(suit, ignore_wild)
  for _, v in ipairs(G.playing_cards or {}) do
    if not SMODS.has_no_suit(v) and (v.base.suit == suit or (not ignore_wild and v:is_suit(suit))) then
      return true
    end
  end
  return false
end

-- Checks if a spectrum hand has been played
--- @return boolean
function PB_UTIL.spectrum_played()
  local spectrum_played = false
  if G and G.GAME and G.GAME.hands then
    for k, v in pairs(G.GAME.hands) do
      if string.find(k, "Spectrum", nil, true) then
        if G.GAME.hands[k].played > 0 then
          spectrum_played = true
          break
        end
      end
    end
  end

  return spectrum_played
end

--- @return boolean
function PB_UTIL.has_modded_suit_in_deck()
  for k, v in ipairs(G.playing_cards or {}) do
    local is_modded = true
    for _, suit in ipairs(PB_UTIL.base_suits) do
      if v.base.suit == suit then
        is_modded = false
      end
    end

    if not SMODS.has_no_suit(v) and is_modded then
      return true
    end
  end
  return false
end

--- Modifies the extra boss scaling added by this mod, this value is temporary and resets once a
--- Boss Blind is defeated
--- @param mult number? multiply the value
--- @param flat number? add a flat amount to it
function PB_UTIL.modify_extra_boss_scaling(mult, flat)
  local amt = G.GAME.round_resets.paperback_extra_boss_scaling
  amt = flat and (amt + flat) or (amt * mult)
  G.GAME.round_resets.paperback_extra_boss_scaling = amt
end

--- Resets the extra boss scaling added by this mod to 1
function PB_UTIL.reset_extra_boss_scaling()
  G.GAME.round_resets.paperback_extra_boss_scaling = 1
end
