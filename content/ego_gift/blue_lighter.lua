PB_UTIL.EGO_Gift {
  key = 'blue_lighter',
  config = {
    sin = 'gloom',
    xmult = 1,
    a_xmult = 0.25
  },
  atlas = 'ego_gift_atlas',
  pos = { x = 4, y = 1 },
  soul_pos = { x = 4, y = 4 },

  ego_loc_vars = function(self, info_queue, card)
    return { vars = {
      card.ability.a_xmult,
      card.ability.xmult
    } }
  end,

  ego_gift_calc = function(self, card, context)
    if context.setting_blind then
      if next(G.consumeables.cards) then
        local targets = {}
        for k, v in ipairs(G.consumeables.cards) do
          if not (PB_UTIL.is_ego_gift(v) or SMODS.is_eternal(v)) then targets[#targets + 1] = v end
        end
        if next(targets) then
          local to_destroy = pseudorandom_element(targets, pseudoseed('blue_lighter_destruction'))
          SMODS.destroy_cards({ to_destroy })
          card.ability.xmult = card.ability.xmult + card.ability.a_xmult
          SMODS.calculate_effect({
            message = localize('k_upgrade_ex'),
            colour = G.C.MULT
          }, card)
        end
      end
    end

    if context.joker_main then
      return {
        xmult = card.ability.xmult
      }
    end
  end
}
