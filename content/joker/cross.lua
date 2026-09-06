---@diagnostic disable: duplicate-set-field

SMODS.Joker {
  key = "cross",
  attributes = {
    'passive',
    'destroy_card'
  },
  rarity = 2,
  pos = { x = 12, y = 12 },
  atlas = "jokers_atlas",
  cost = 6,
  unlocked = false,
  discovered = false,
  blueprint_compat = false,
  eternal_compat = true,
  perishable_compat = true,
  paperback_credit = {
    coder = { 'infinityplus' },
  },

  calculate = function(self, card, context)
    if context.discard and context.other_card then
      context.other_card.paperback_cross_discard = true
    end

    if context.check_eternal then
      local trigger = context.trigger or {}

      if trigger.from_sell then
        return
      end

      return {
        no_destroy = true,
      }
    end
  end,

  check_for_unlock = function(self, args)
    if args.type == 'modify_deck' then
      for _, v in ipairs(G.playing_cards or {}) do
        if PB_UTIL.is_rank(v, "paperback_Apostle") then
          return true
        end
      end
    end
  end,
}

local function cross_prevents_destruction(card)
  if not SMODS.is_playing_card(card) or not next(SMODS.find_card('j_paperback_cross')) then
    return false
  end

  local cross = SMODS.find_card('j_paperback_cross')[1]
  card_eval_status_text(cross, 'extra', nil, nil, nil, {
    message = localize('paperback_prevented_ex'),
    colour = G.C.BLUE,
  })
  card.paperback_cross_prevented = true

  if card.area == G.play or (card.area == G.hand and card.paperback_cross_discard) then
    card.getting_sliced = nil
    card.destroyed = nil
    card.shattered = nil
    draw_card(card.area, G.discard, 50, 'down', false, card)
    card.paperback_cross_discard = nil
  elseif card.area == G.hand then
    card.paperback_cross_prevented = nil
  end

  return true
end

local shatter_ref = Card.shatter
function Card:shatter(args)
  if cross_prevents_destruction(self) then
    return false
  end

  return shatter_ref(self, args)
end

local start_dissolve_ref = Card.start_dissolve
function Card:start_dissolve(dissolve_colours, silent, dissolve_time_fac, no_juice)
  if cross_prevents_destruction(self) then
    return false
  end

  return start_dissolve_ref(self, dissolve_colours, silent, dissolve_time_fac, no_juice)
end

local emplace_ref = CardArea.emplace
function CardArea:emplace(card, location, stay_flipped)
  local ret = emplace_ref(self, card, location, stay_flipped)
  if self == G.discard then
    card.paperback_cross_discard = nil
    card.paperback_cross_prevented = nil
  end
  return ret
end

local calculate_context_ref = SMODS.calculate_context
function SMODS.calculate_context(context, return_table, no_resolve)
  if context.destroying_card and next(SMODS.find_card('j_paperback_cross')) then
    return return_table and return_table or {}
  end

  if context.remove_playing_cards and next(SMODS.find_card('j_paperback_cross')) then
    local removed = context.removed
    local filtered = {}
    for _, card in ipairs(removed or {}) do
      if not card.paperback_cross_prevented then
        filtered[#filtered + 1] = card
      end
    end
    context.removed = filtered
    local ret = calculate_context_ref(context, return_table, no_resolve)
    context.removed = removed
    return ret
  end

  if context.cards_destroyed and context.glass_shattered and next(SMODS.find_card('j_paperback_cross')) then
    local glass_shattered = context.glass_shattered
    local filtered = {}
    for _, card in ipairs(glass_shattered) do
      if not card.paperback_cross_prevented then
        filtered[#filtered + 1] = card
      end
    end
    context.glass_shattered = filtered
    local ret = calculate_context_ref(context, return_table, no_resolve)
    context.glass_shattered = glass_shattered
    for _, card in ipairs(glass_shattered) do
      card.paperback_cross_prevented = nil
    end
    return ret
  end

  -- glass joker why are you like this
  if context.using_consumeable and context.consumeable
  and context.consumeable.ability.name == 'The Hanged Man'
  and next(SMODS.find_card('j_paperback_cross')) then
    local highlighted = G.hand.highlighted
    for _, card in ipairs(highlighted or {}) do
      card.paperback_cross_prevented = true
    end
    G.hand.highlighted = {}
    local ret = calculate_context_ref(context, return_table, no_resolve)
    G.hand.highlighted = highlighted
    return ret
  end

  return calculate_context_ref(context, return_table, no_resolve)
end