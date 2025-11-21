SMODS.Joker {
  key = 'jimbos_inferno',
  config = {
    extra = {
      mult_per_dark = 2,
    }
  },
  rarity = 1,
  pos = { x = 19, y = 8 },
  atlas = "jokers_atlas",
  cost = 5,
  unlocked = true,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,


  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = PB_UTIL.suit_tooltip('dark')

    local dark = 0
    if G.hand then
      for k, v in pairs(G.hand.cards) do
        if PB_UTIL.is_suit(v, 'dark', false, true) and not v.highlighted then dark = dark + 1 end
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
      if context.other_card and PB_UTIL.is_suit(context.other_card, 'dark') then
        local dark = 0

        for k, v in pairs(G.hand.cards) do
          if PB_UTIL.is_suit(v, 'dark', false, true) and not v.highlighted then dark = dark + 1 end
        end

        return {
          mult = dark * card.ability.extra.mult_per_dark,
        }
      end
    end
  end,
}
