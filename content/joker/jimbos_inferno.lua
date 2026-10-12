SMODS.Joker {
  key = 'jimbos_inferno',
  config = {
    extra = {
      mult_per_dark = 2,
    }
  },
  attributes = {
    'mult',
    'suit',
    'dark'
  },
  rarity = 1,
  pos = { x = 19, y = 8 },
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

  locked_loc_vars = function (self, info_queue, card)
    return {vars = { 5 }}
  end,

  check_for_unlock = function (self, args)
    return G.GAME.paperback.played_dark_suit_hands >= 5
  end,

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = PB_UTIL.suit_tooltip('dark')

    local dark = 0
    if G.hand then
      for k, v in pairs(G.hand.cards) do
        if v:is_suit_shade('dark') and not v.highlighted then dark = dark + 1 end
      end
    end

    return {
      vars = {
        card.ability.extra.mult_per_dark,
        dark * card.ability.extra.mult_per_dark
      }
    }
  end,

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      if context.other_card and context.other_card:is_suit_shade('dark') then
        local dark = 0

        for k, v in pairs(G.hand.cards) do
          if v:is_suit_shade('dark')and not v.highlighted then dark = dark + 1 end
        end

        return {
          mult = dark * card.ability.extra.mult_per_dark,
        }
      end
    end
  end,
}
