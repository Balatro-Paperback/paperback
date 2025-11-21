PB_UTIL.MinorArcana {
  key = 'nine_of_swords',
  config = {
    extra = {
      max_jokers = 1,
      money = 5,
    }
  },
  atlas = 'minor_arcana_atlas',
  pos = { x = 1, y = 5 },

  can_use = function(self, card)
    if #G.jokers.highlighted == card.ability.extra.max_jokers then
      return true
    end
  end,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.max_jokers,
        card.ability.extra.money,
      }
    }
  end,

  use = function(self, card, area)
    local joker = G.jokers.highlighted[1]
    if joker.config.center.paperback and joker.config.center.paperback.indestructible then
      -- Same as two of pentacles, bit of a hack
      G.P_CENTERS[card.config.center.key].shatters = true
      SMODS.destroy_cards(card)
      G.P_CENTERS[card.config.center.key].shatters = false
      return
    end

    G.GAME.paperback.banned_run_keys[joker.config.center_key] = true
    PB_UTIL.destroy_joker(joker, function()
      card:juice_up()
      ease_dollars(card.ability.extra.money, true)
    end)
  end
}
