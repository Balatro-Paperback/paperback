SMODS.Joker {
  key = "grenadine",
  config = {
    extra = {
      amount = 0.2,
      suit = "Hearts",
      remaining = 5,
      upgrade = "perma_x_mult",
    }
  },
  attributes = {
    'xmult',
    'modify_card',
    'perma_bonus',
    'suit',
    'hearts',
    'food',
    'red'
  },
  rarity = 2,
  pos = { x = 23, y = 10 },
  atlas = "jokers_atlas",
  cost = 6,
  unlocked = false,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = false,
  perishable_compat = false,
  soul_pos = nil,
  pools = {
    Food = true
  },
  paperback_credit = {
    coder = { 'dowfrin' },
  },

  locked_loc_vars = function (self, info_queue, card)
    return {vars = {5, localize(card.ability.extra.suit, 'suits_singular'),}}
  end,

  check_for_unlock = function (self, args)
    if args.type == 'paperback_suit_flushes' then
      if G.GAME.paperback.played_flushes['Hearts'] and G.GAME.paperback.played_flushes['Hearts'] >= 5 then
        return true
      end
    end
  end,

  calculate = PB_UTIL.suit_drink_calculate,

  loc_vars = PB_UTIL.suit_drink_loc_vars
}
