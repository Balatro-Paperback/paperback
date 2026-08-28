SMODS.Joker {
  key = "aperol",
  config = {
    extra = {
      suit = "Diamonds",
      amount = 1,
      remaining = 5,
      upgrade = "perma_p_dollars",
    }
  },
  attributes = {
    'economy',
    'modify_card',
    'perma_bonus',
    'suit',
    'diamonds',
    'food'
  },
  rarity = 2,
  pos = { x = 24, y = 0 },
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
  paperback = {
    suit_drink = true
  },
  paperback_credit = {
    coder = { 'dowfrin' }
  },

  locked_loc_vars = function (self, info_queue, card)
    return {vars = {5, localize(card.ability.extra.suit, 'suits_singular'),}}
  end,

  check_for_unlock = function (self, args)
    if args.type == 'paperback_suit_flushes' then
      if G.GAME.paperback.played_flushes['Diamonds'] and G.GAME.paperback.played_flushes['Diamonds'] >= 5 then
        return true
      end
    end
  end,

  calculate = PB_UTIL.suit_drink_calculate,

  loc_vars = PB_UTIL.suit_drink_loc_vars
}
