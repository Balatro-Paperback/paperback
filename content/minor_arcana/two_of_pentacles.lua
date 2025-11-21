PB_UTIL.MinorArcana {
  key = 'two_of_pentacles',
  atlas = 'minor_arcana_atlas',
  pos = { x = 1, y = 6 },

  in_pool = function(self, args)
    if G.GAME.challenge then
      -- if challenge starts with eternal jokers then return false
      for i, v in ipairs(SMODS.Challenges[G.GAME.challenge].jokers) do
        if v.eternal then return false end
      end
      if G.GAME.challenge == "c_non_perishable_1" or G.GAME.challenge == "c_typecast_1" then
        return false
      end
    end
    return true
  end,

  can_use = function(self, card)
    if G.jokers and #G.jokers.highlighted == 1 then
      local joker = G.jokers.highlighted[1]

      -- checks for non-compatible jokers that have eternal anyway
      -- just in case :P
      return joker.config.center.eternal_compat or joker.ability.eternal
    end
  end,

  keep_on_use = function(self, card)
    return G.jokers.highlighted[1].config.center.paperback and G.jokers.highlighted[1].config.center.paperback.permanently_eternal
  end,

  use = function(self, card)
    local joker = G.jokers.highlighted[1]

    if joker.config.center.paperback and joker.config.center.paperback.permanently_eternal then
      G.P_CENTERS[card.config.center.key].shatters = true
      SMODS.destroy_cards(card)
      G.P_CENTERS[card.config.center.key].shatters = false
    else
      PB_UTIL.use_consumable_animation(card, joker, function()
        if joker.ability.eternal then
          joker:set_eternal(false)
        else
          if joker.ability.perishable then
            joker.ability.perishable = nil
            joker.ability.perish_tally = nil
            SMODS.recalc_debuff(joker)
          end
          joker:set_eternal(true)
        end
      end)
    end
  end
}
