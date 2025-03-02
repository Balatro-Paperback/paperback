SMODS.Joker {
  key = "bismuth",
  config = {
    extra = {
      odds = 5
    }
  },
  rarity = 2,
  pos = { x = 3, y = 9 },
  atlas = "jokers_atlas",
  cost = 7,
  unlocked = true,
  discovered = true,
  blueprint_compat = false,
  eternal_compat = true,

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.m_wild
    info_queue[#info_queue + 1] = G.P_CENTERS.e_foil
    info_queue[#info_queue + 1] = G.P_CENTERS.e_holo
    info_queue[#info_queue + 1] = G.P_CENTERS.e_polychrome

    return {
      vars = {
        G.GAME.probabilities.normal,
        card.ability.extra.odds
      }
    }
  end,

  calculate = function(self, card, context)
    local ctx = context.paperback

    if not context.blueprint and ctx and ctx.modify_final_hand then
      local triggered

      for k, v in pairs(ctx.full_hand) do
        local roll = pseudorandom('bismuth') < G.GAME.probabilities.normal / card.ability.extra.odds
        if not v.edition and not v.debuff and SMODS.has_enhancement(v, 'm_wild') and roll then
          triggered = true

          local edition = poll_edition('bismuth', nil, nil, true, {
            'e_foil',
            'e_holo',
            'e_polychrome'
          })

          v:set_edition(edition)
        end
      end

      if triggered then
        return {
          message = localize('paperback_edition_ex'),
          colour = G.C.DARK_EDITION
        }
      end
    end
  end
}
