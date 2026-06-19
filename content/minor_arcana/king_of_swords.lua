PB_UTIL.MinorArcana {
  key = 'king_of_swords',
  attributes = {
    'joker'
  },
  atlas = 'minor_arcana_atlas',
  pos = { x = 6, y = 5 },
  paperback_credit = {
    coder = { 'srockw' }
  },

  -- Thanks mys. minty!
  loc_vars = function(self, info_queue, card)
    local mod_key = self.key
    if next(SMODS.find_mod("Bunco")) then
      mod_key = mod_key .. "_bunc"
    end
    return {
      key = mod_key
    }
  end,

  in_pool = function(self, args)
    return G.GAME.modifiers.enable_perishables_in_shop and G.GAME.modifiers.enable_rentals_in_shop
  end,

  can_use = function(self, card)
    if G.jokers and #G.jokers.highlighted == 1 then
      local joker = G.jokers.highlighted[1]

      return (
        joker.ability.rental or
        joker.ability.perishable or
        joker.ability.bunc_scattering or
        joker.ability.bunc_hindered or
        joker.ability.bunc_reactive
      )
    end
  end,

  use = function(self, card)
    local joker = G.jokers.highlighted[1]

    PB_UTIL.use_consumable_animation(card, joker, function()
      joker:set_rental(false)
      -- For some reason set_perishable just ignores the parameter, while set_rental properly uses it
      joker.ability.perishable = nil
      joker.ability.perish_tally = nil
      joker.ability.bunc_scattering = nil
      joker.ability.bunc_hindered = nil
      joker.ability.bunc_reactive = nil
      SMODS.recalc_debuff(joker)
    end)
  end
}
