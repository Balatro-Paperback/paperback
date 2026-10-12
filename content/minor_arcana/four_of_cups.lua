PB_UTIL.MinorArcana {
  key = 'four_of_cups',
  config = {
    max_highlighted = 3,
    extra = {
      money = 5
    }
  },
  attributes = {
    'modify_card',
    'enhancements',
    'seals',
    'editions',
    'economy'
  },
  atlas = 'minor_arcana_atlas',
  pos = { x = 3, y = 0 },
  paperback_credit = {
    coder = { 'srockw' }
  },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.max_highlighted,
        card.ability.extra.money
      }
    }
  end,

  use = function(self, card, area)
    PB_UTIL.use_consumable_animation(card, G.hand.highlighted, function()
      local money = 0

      for _, v in ipairs(G.hand.highlighted) do
        for _, _ in pairs(SMODS.get_enhancements(v)) do
          money = money + card.ability.extra.money
        end
        v:set_ability(G.P_CENTERS.c_base)

        if v.seal then
          money = money + card.ability.extra.money
          v:set_seal(nil, true, true)
        end

        if v.edition then
          money = money + card.ability.extra.money
          v:set_edition(nil, true, true)
        end
      end

      if money > 0 then
        ease_dollars(money)
      end
    end)
  end
}
