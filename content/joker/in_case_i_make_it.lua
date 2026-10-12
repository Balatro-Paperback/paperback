SMODS.Joker {
  key = "in_case_i_make_it",
  config = {
    extra = {
      a_pchips = 10,
    }
  },
  attributes = {
    'chips',
    'modify_card',
    'perma_bonus',
    'rankless',
    'music'
  },
  pools = {
    Music = true
  },
  rarity = 2,
  pos = { x = 18, y = 2 },
  atlas = "jokers_atlas",
  cost = 5,
  unlocked = false,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,
  paperback_credit = {
    coder = { 'dowfrin' },
  },

  check_for_unlock = function(self, args)
    local stone_in_deck = false
    local wrapped_in_deck = false
    for _, v in ipairs(G.playing_cards or {}) do
      if SMODS.has_enhancement(v, 'm_stone') then
        stone_in_deck = true
      end
      if SMODS.has_enhancement(v, 'm_paperback_wrapped') then
        wrapped_in_deck = true
      end
    end
    return stone_in_deck and wrapped_in_deck 
  end,

  locked_loc_vars = function(self, info_queue, card)
    return { vars = { localize { type = 'name_text', key = 'm_stone', set = 'Enhanced' },
                      localize { type = 'name_text', key = 'm_paperback_wrapped', set = 'Enhanced' } } }
  end,

  in_pool = function(self, args)
    for _, v in ipairs(G.playing_cards or {}) do
      if SMODS.has_no_rank(v) then
        return true
      end
    end
  end,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.a_pchips
      },
    }
  end,

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      if SMODS.has_enhancement(context.other_card, 'm_stone') or SMODS.has_no_rank(context.other_card) then
        context.other_card.ability.perma_bonus = (context.other_card.ability.perma_bonus or
          0) + card.ability.extra.a_pchips
        return {
          message = localize('k_upgrade_ex')
        }
      end
    end
  end
}
