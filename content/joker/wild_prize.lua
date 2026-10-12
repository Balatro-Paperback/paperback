SMODS.Joker {
  key = "wild_prize",
  config = {
    extra = {
      a_money_low = -1,
      a_money_high = 9,
      retrigger_odds = 4,
      money_odds = 2,
    }
  },
  attributes = {
    'retrigger',
    'economy',
    'chance',
    'enhancements'
  },
  rarity = 1,
  pos = { x = 5, y = 2 },
  atlas = "jokers_atlas",
  cost = 7,
  unlocked = false,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,
  enhancement_gate = 'm_wild',

  paperback_credit = {
    coder = { 'oppositewolf' }
  },

  check_for_unlock = function(self, args)
    if args.type == 'hand' then
      local one = false
      local nine1 = false
      local nine2 = false
      local seven = false
      for _, v in ipairs(args.scoring_hand) do
        if PB_UTIL.is_rank(v, 'Ace') then
          one = true
        elseif PB_UTIL.is_rank(v, '9') then
          if not nine1 then
            nine1 = true
          else
            nine2 = true
          end
        elseif PB_UTIL.is_rank(v, '7') then
          seven = true
        end
      end
      if one and nine1 and nine2 and seven then
        return true
      end
    end
  end,

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.m_wild

    local n1, d1 = PB_UTIL.chance_vars(card, nil, nil, card.ability.extra.retrigger_odds)
    local n2, d2 = PB_UTIL.chance_vars(card, nil, nil, card.ability.extra.money_odds)

    return {
      vars = {
        n1, d1, n2, d2,
        SMODS.signed_dollars(card.ability.extra.a_money_low),
        card.ability.extra.a_money_high,
        localize {
          type = 'name_text',
          set = 'Enhanced',
          key = 'm_wild'
        },
      }
    }
  end,

  calculate = function(self, card, context)
    -- Check if the card is wild and it needs to give money
    if context.individual and context.cardarea == G.play then
      if SMODS.has_enhancement(context.other_card, 'm_wild') then
        if PB_UTIL.chance(card, "wild_prize_money", nil, card.ability.extra.money_odds) then
          local dollars = pseudorandom("Wild Prize Money Amount", card.ability.extra.a_money_low,
            card.ability.extra.a_money_high)
          G.GAME.dollar_buffer = (G.GAME.dollar_buffer or 0) + dollars
          G.E_MANAGER:add_event(Event({
            func = (function()
              G.GAME.dollar_buffer = 0; return true
            end)
          }))
          return {
            dollars = dollars,
            card = card
          }
        end
      end
    end

    -- Check if card is wild and it needs to be retriggered
    if context.repetition and context.cardarea == G.play then
      if SMODS.has_enhancement(context.other_card, 'm_wild') then
        if PB_UTIL.chance(card, "wild_prize_retrigger", nil, card.ability.extra.retrigger_odds) then
          return {
            message = localize('k_again_ex'),
            repetitions = 1,
            card = card
          }
        end
      end
    end
  end
}
