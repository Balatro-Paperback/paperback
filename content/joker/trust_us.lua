SMODS.Joker {
  key = "trust_us",
  config = {
    extra = {
      active_xmult = 3,
      inactive_xmult = 0.5,
    },
  },
  attributes = {
    'xmult',
    'hand_type'
  },
  rarity = 2,
  pos = { x = 24, y = 5 },
  atlas = "jokers_atlas",
  cost = 6,
  unlocked = false,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,
  soul_pos = nil,
  pools = {
    Music = true
  },

  paperback_credit = {
    coder = { 'vitellary' }
  },

  locked_loc_vars = function(self, info_queue, card)
    return { vars = { localize('Three of a Kind', 'poker_hands') } }
  end,
  check_for_unlock = function(self, args)
    if args.type == 'win' then
      return PB_UTIL.get_most_played_hands()[1].key == 'Three of a Kind'
    end
  end,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.active_xmult,
        card.ability.extra.inactive_xmult,
        localize("Three of a Kind", 'poker_hands')
      }
    }
  end,

  calculate = function(self, card, context)
    if context.joker_main then
      if next(context.poker_hands["Three of a Kind"]) then
        return { xmult = card.ability.extra.active_xmult }
      else
        return { xmult = card.ability.extra.inactive_xmult }
      end
    end
  end
}
