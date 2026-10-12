local function get_enhanced()
  local count = 0
  for _, v in ipairs(G.playing_cards or {}) do
    if v.ability.set == 'Enhanced' then
      count = count + 1
    end
  end
  return count
end

SMODS.Joker {
  key = "golden_apple",
  config = {
    extra = {
      money = 1,
      rounds = 3,
    }
  },
  attributes = {
    'economy',
    'enhancements',
    'full_deck',
    'food'
  },
  rarity = 2,
  pos = { x = 24, y = 6 },
  atlas = "jokers_atlas",
  cost = 7,
  unlocked = false,
  discovered = false,
  blueprint_compat = false,
  eternal_compat = false,
  perishable_compat = true,
  soul_pos = nil,
  pools = {
    Food = true
  },
  paperback_credit = {
    coder = { 'vitellary' },
  },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.money,
        card.ability.extra.rounds,
        get_enhanced(),
      }
    }
  end,

  locked_loc_vars = function(self, info_queue, card)
    return { vars = { 5 } }
  end,

  check_for_unlock = function(self, args)
    if args.type == 'modify_deck' then
      local count = 0
      for _, v in ipairs(G.playing_cards or {}) do
        if SMODS.has_enhancement(v, 'm_gold') and PB_UTIL.is_rank(v, 'Ace') then
          count = count + 1
          if count >= 5 then
            return true
          end
        end
      end
      return false
    end
  end,

  in_pool = function(self, args)
    for _, v in ipairs(G.playing_cards or {}) do
      if v.ability.set == 'Enhanced' then
        return true
      end
    end
    return false
  end,

  calc_dollar_bonus = function(self, card)
    return get_enhanced()
  end,

  calculate = function(self, card, context)
    if context.paperback and context.paperback.cashing_out then
      card.ability.extra.rounds = card.ability.extra.rounds - 1
      if card.ability.extra.rounds <= 0 then
        PB_UTIL.destroy_joker(card)
        return {
          message = localize('k_eaten_ex'),
          colour = G.C.FILTER
        }
      else
        return {
          message = localize {
            type = 'variable',
            key = 'paperback_a_round_minus',
            vars = { 1 }
          }
        }
      end
    end
  end
}
