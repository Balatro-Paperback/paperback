---@diagnostic disable: duplicate-set-field
-- Initializes default values in the game object
local init_game_object_ref = Game.init_game_object
function Game.init_game_object(self)
  local ret = init_game_object_ref(self)

  -- referenced code from Ortalab to get the list of secret hands
  -- but also kinda not anymore (thanks N')
  local secrets = {}
  for k, v in pairs(SMODS.PokerHands) do
    if (type(v.visible) == 'function' and not v:visible()) or v.visible == false then table.insert(secrets, k) end
  end

  ret.paperback = {
    round = {
      scored_clips = 0
    },
    ceramic_inc = 0,
    bandaged_inc = 0,
    stained_inc = 0,
    destroyed_dark_suits = 0,
    last_tarot_energized = false,
    ranks_scored_this_ante = {},
    last_scored_suit = 'Spades',
    domino_ranks = {},
    jjjj_count = 0,
    banned_run_keys = {},
    secret_hands = secrets,
    arcana_used = {},

    weather_radio_hand = 'High Card',
    joke_master_hand = 'High Card',
    da_capo_suit = 'Clubs',

    skipped_blind = false,
    blind_multiplier = 1,

    corroded_rounds = 3
  }
  return ret
end

---@diagnostic disable: duplicate-set-field, lowercase-global
-- Creates the flags
local BackApply_to_run_ref = Back.apply_to_run
function Back.apply_to_run(arg_56_0)
  BackApply_to_run_ref(arg_56_0)
  G.GAME.pool_flags.quick_fix_can_spawn = true
  G.GAME.pool_flags.soft_taco_can_spawn = false
  G.GAME.pool_flags.ghost_cola_can_spawn = false
  G.GAME.pool_flags.dreamsicle_can_spawn = true
  G.GAME.pool_flags.cakepop_can_spawn = true
  G.GAME.pool_flags.caramel_apple_can_spawn = true
  G.GAME.pool_flags.charred_marshmallow_can_spawn = true
  G.GAME.pool_flags.rock_candy_can_spawn = true
  G.GAME.pool_flags.tanghulu_can_spawn = true
  G.GAME.pool_flags.sticks_can_spawn = false
  G.GAME.pool_flags.paperback_alert_can_spawn = true
  G.GAME.pool_flags.paperback_legacy_can_spawn = false
  G.GAME.pool_flags.plague_doctor_can_spawn = true

  G.P_CENTERS['j_diet_cola']['no_pool_flag'] = 'ghost_cola_can_spawn'
end

-- Draws a debuffed shader on top of cards in your collection if they are disabled
-- as a consequence of a certain setting being disabled in our config
local draw_ref = Card.draw
function Card.draw(self, layer)
  local ret = draw_ref(self, layer)

  if not self.debuff and self.area and self.area.config and self.area.config.collection then
    local config = self.config and self.config.center and self.config.center.paperback or {}
    local disabled = false

    for _, v in ipairs(config.requirements or {}) do
      if not PB_UTIL.config[v.setting] then
        disabled = true
        break
      end
    end

    if disabled then
      self.children.center:draw_shader('debuff', nil, self.ARGS.send_to_shader)
    end
  end

  return ret
end

-- Count scored Clips each round
local eval_card_ref = eval_card
function eval_card(card, context)
  local ret, ret2 = eval_card_ref(card, context)

  if context.cardarea == G.play and context.main_scoring and ret and ret.playing_card then
    if PB_UTIL.has_paperclip(card) then
      G.GAME.paperback.round.scored_clips = G.GAME.paperback.round.scored_clips + 1

      -- Add a new context for our Paperclips when held in hand
      for _, v in ipairs(G.hand.cards) do
        local key = PB_UTIL.has_paperclip(v)
        local clip = SMODS.Stickers[key]

        if clip and clip.calculate and type(clip.calculate) == "function" then
          clip:calculate(v, {
            paperback = {
              clip_scored = true,
              other_card = card
            }
          })
        end
      end
    end
  end

  return ret, ret2
end

-- Add new context that happens before triggering tags
local yep_ref = Tag.yep
function Tag.yep(self, message, _colour, func)
  SMODS.calculate_context({
    paperback = {
      using_tag = true,
      tag = self
    }
  })

  return yep_ref(self, message, _colour, func)
end

-- Add new context that happens after destroying jokers
local remove_ref = Card.remove
function Card.remove(self)
  -- Check that the card being removed is a joker that's in the player's deck and that it's not being sold
  if self.added_to_deck and self.ability.set == 'Joker' and not G.CONTROLLER.locks.selling_card then
    SMODS.calculate_context({
      paperback = {
        destroying_joker = true,
        destroyed_joker = self
      }
    })
  end

  return remove_ref(self)
end

-- Add new context that happens when pressing the cash out button
local cash_out_ref = G.FUNCS.cash_out
G.FUNCS.cash_out = function(e)
  SMODS.calculate_context({
    paperback = {
      cashing_out = true
    }
  })

  cash_out_ref(e)
end

-- Adds a new context for leveling up a hand
local level_up_hand_ref = level_up_hand
function level_up_hand(card, hand, instant, amount)
  local ret = level_up_hand_ref(card, hand, instant, amount)

  SMODS.calculate_context({
    paperback = {
      level_up_hand = true
    }
  })

  return ret
end

local calculate_repetitions_ref = SMODS.calculate_repetitions
SMODS.calculate_repetitions = function(card, context, reps)
  for _, area in ipairs(SMODS.get_card_areas('playing_cards')) do
    for k, v in ipairs(area.cards or {}) do
      if v ~= card then
        if v:can_calculate(context.ignore_debuff, context.remove_playing_cards) then
          local eval = v:calculate_enhancement {
            paperback = {
              other_card = card,
              cardarea = card.area,
              scoring_hand = context.scoring_hand,
              repetition_from_playing_card = true,
            }
          }
          if eval and eval.repetitions then
            for _ = 1, eval.repetitions do
              eval.card = eval.card or card
              eval.message = eval.message or (not eval.remove_default_message and localize('k_again_ex'))
              reps[#reps + 1] = { key = eval }
            end
          end
        end
      end
    end
  end

  return calculate_repetitions_ref(card, context, reps)
end

-- For nichola
local calculate_main_scoring_ref = SMODS.calculate_main_scoring
function SMODS.calculate_main_scoring(context, scoring_hand)
  calculate_main_scoring_ref(context, scoring_hand)
  if context.cardarea == G.play then
    SMODS.calculate_context {
      paperback = {
        nichola = true -- Name can be changed later
        -- the context is "after played cards score", a better name probably exists
      },
      full_hand = G.play.cards,
      scoring_hand = context.scoring_hand,
      scoring_name = context.scoring_name,
      poker_hands = context.poker_hands
    }
  end
end

-- New context for when a tag is added
local add_tag_ref = add_tag
function add_tag(tag)
  SMODS.calculate_context {
    paperback = {
      tag_acquired = true,
      tag = tag
    }
  }

  return add_tag_ref(tag)
end

-- Ace still can't wrap around straights even though it's no longer straight_edge
-- accounts for Shortcut by checking for Q and 3 as well
local get_straight_ref = get_straight
function get_straight(hand, min_length, skip, wrap)
  local orig_straights = get_straight_ref(hand, min_length, skip, wrap)
  local result = {}
  for _, straight in ipairs(orig_straights) do
    local has_king_queen = false
    local has_2_3 = false
    for i = 1, #straight do
      if straight[i]:get_id() == 13 or straight[i]:get_id() == 12 then has_king_queen = true end
      if straight[i]:get_id() == 2 or straight[i]:get_id() == 3 then has_2_3 = true end
    end
    if not (has_king_queen and has_2_3) then table.insert(result, straight) end
  end
  return result
end

-- Apostle-high straight flushes get renamed to "Rapture"
local poker_hand_info_ref = G.FUNCS.get_poker_hand_info
function G.FUNCS.get_poker_hand_info(_cards)
  local text, loc_disp_text, poker_hands, scoring_hand, disp_text = poker_hand_info_ref(_cards)
  if text == "Straight Flush" then
    local has_apostle = false
    local all_top = true
    for i = 1, #scoring_hand do
      local rank = not SMODS.has_no_rank(scoring_hand[i]) and SMODS.Ranks[scoring_hand[i].base.value]
      if rank.key == 'paperback_Apostle' then has_apostle = true end
      if rank.key ~= 'Ace' and rank.key ~= 'paperback_Apostle' and not rank.face then all_top = false end
    end

    if has_apostle and all_top then
      disp_text = "paperback_Straight Flush (Rapture)"
      loc_disp_text = localize(disp_text, "poker_hands")
    end
  end

  return text, loc_disp_text, poker_hands, scoring_hand, disp_text
end


-- When calculating the sell cost for an E.G.O. Gift, override it to 0
-- None and Pride respectively get set to 5 and -15
-- Unless corroded
local set_cost_ref = Card.set_cost
function Card.set_cost(self)
  local ret = set_cost_ref(self)
  if self.added_to_deck then
    if self.config.center.set == "paperback_ego_gift" and self.ability.sin then
      if self.ability.sin == 'pride' or self.ability.sin == 'none' then
        self.sell_cost = PB_UTIL.EGO_GIFT_SINS[self.ability.sin][1]
      else
        self.sell_cost = 0
      end
    end
    return ret
  end
end

local can_sell_ref = Card.can_sell_card
function Card.can_sell_card(self, context)
  if self.ability.sin and self.ability.sin == 'sloth' then
    if self.ability.paperback_corroded then
      return true
    else
      return G.GAME.paperback.skipped_blind
    end
  end

  return can_sell_ref(self, context)
end

-- Used for checking for eternal compatibility against temporary and corroded
local set_eternal_ref = Card.set_eternal
function Card.set_eternal(self, eternal)
  if self.ability.paperback_temporary or self.ability.paperback_corroded then
    return false
  else
    local ret = set_eternal_ref(self, eternal)
    return ret
  end
end

-- Redoing this a bit more accurately than Bunco
local inc_career_stat_ref = inc_career_stat
function inc_career_stat(stat, mod)
  if stat == 'c_shop_dollars_spent' then
    if to_big(mod) > to_big(0) then
      G.GAME.paperback.this_shop_dollars_spent = (G.GAME.paperback.this_shop_dollars_spent or 0) + mod
      check_for_unlock({type = 'spend_in_one_shop', spent = G.GAME.paperback.this_shop_dollars_spent})
    end
  end
  return inc_career_stat_ref(stat, mod)
end

local toggle_shop_ref = G.FUNCS.toggle_shop
G.FUNCS.toggle_shop = function(e)
  toggle_shop_ref(e)
  if G.shop then
    G.GAME.paperback.this_shop_dollars_spent = nil
  end
end
