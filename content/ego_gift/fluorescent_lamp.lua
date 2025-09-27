PB_UTIL.EGO_Gift {
  key = 'fluorescent_lamp',
  config = {
    sin = 'pride',
    discards = 1,
    threshold = 2,
    total = 1
  },
  atlas = 'ego_gift_atlas',
  pos = { x = 5, y = 2 },
  soul_pos = { x = 5, y = 5 },


  ego_gift_calc = function(self, card, context)
    if context.setting_blind then
      local selected_card = context.blueprint_card or card
      G.E_MANAGER:add_event(Event({
        func = function()
          card.ability.total = card.ability.discards +
              card.ability.discards *
              math.max(0, math.floor((G.jokers.config.card_limit - #G.jokers.cards) / card.ability.threshold))
          ease_discard(card.ability.total)
          SMODS.calculate_effect({
              message = localize { type = 'variable', key = 'paperback_a_discards', vars = { card.ability.total } },
              colour = G.C.RED,
              instant = true
            },
            selected_card)
          return true
        end
      }))
      return nil, true
    end
  end,

  ego_loc_vars = function(self, info_queue, card)
    if G.jokers then
      card.ability.total = card.ability.discards +
          card.ability.discards *
          math.max(0, math.floor((G.jokers.config.card_limit - #G.jokers.cards) / card.ability.threshold))
    else
      card.ability.total = card.ability.discards
    end
    return {
      card.ability.discards,
      card.ability.threshold,
      card.ability.total
    }
  end,
}
