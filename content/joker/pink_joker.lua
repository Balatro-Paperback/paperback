SMODS.Sound {
  key = 'mario-paint-meow',
  path = 'mario-paint-meow.ogg',
}

SMODS.Joker {
  key = "pink_joker",
  config = {
    extra = {
      odds = 5,
      p_dollars = 2,
    }
  },
  attributes = {
    'modify_card',
    'perma_bonus',
    'economy',
    'chance'
  },
  rarity = 1,
  pos = { x = 7, y = 13 },
  atlas = "jokers_atlas",
  cost = 7,
  unlocked = false,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,
  paperback_credit = {
    coder = { 'dowfrin' }
  },

  enhancement_gate = "m_paperback_stained",
  locked_loc_vars = function(self, info_queue, card)
    return {
      vars = {
        -- something something the seven stained souls
        7
      }
    }
  end,

  check_for_unlock = function(self, args)
    if args.type == 'modify_deck' then
      local count = 0
      for _, v in pairs(G.playing_cards) do
        if SMODS.has_enhancement(v, 'm_paperback_stained') then
          count = count + 1
        end
      end

      if count >= 7 then
        return true
      end
    end
  end,

  loc_vars = function(self, info_queue, card)
    local numerator, denominator = PB_UTIL.chance_vars(card)
    return {
      vars = {
        numerator, denominator,
        card.ability.extra.p_dollars
      }
    }
  end,

  calculate = function(self, card, context)
    if context.individual and not context.retrigger and (context.cardarea == G.play) then
      for i, v in ipairs(G.hand.cards) do
        if SMODS.has_enhancement(v, 'm_paperback_stained')
        and (not context.other_card.ability.perma_p_dollars or (context.other_card.ability.perma_p_dollars and context.other_card.ability.perma_p_dollars < card.ability.extra.p_dollars))
        and PB_UTIL.chance(card, 'j_paperback_pink_joker_coins') then
          return {
            message = localize('k_upgrade_ex'),
            func = function()
              context.other_card.ability.perma_p_dollars = card.ability.extra.p_dollars
              context.other_card:juice_up()
            end
          }
        end
      end
    end
  end,
}
