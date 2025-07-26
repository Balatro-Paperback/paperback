SMODS.Joker {
  key = "card_sleeve",
  rarity = 1,
  pos = { x = 18, y = 8 },
  atlas = "jokers_atlas",
  cost = 4,
  blueprint_compat = false,
  eternal_compat = false,
  perishable_compat = true,

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = { key = 'eternal', set = 'Other' }

    local other_joker = nil
    if G.jokers then
      for i = 1, #G.jokers.cards do
        if G.jokers.cards[i] == card then other_joker = G.jokers.cards[i + 1] end
      end
    end

    if other_joker then
      -- Conditions from `Card:set_eternal`
      local compat = other_joker.config.center.eternal_compat and not other_joker.ability.perishable and
          not other_joker.ability.paperback_temporary
      local color = compat and G.C.GREEN or G.C.RED
      local text = compat and 'k_compatible' or 'k_incompatible'

      return {
        main_end = {
          {
            n = G.UIT.C,
            config = { align = "bm", padding = 0.02 },
            nodes = {
              {
                n = G.UIT.C,
                config = { align = "m", colour = color, r = 0.05, padding = 0.06 },
                nodes = {
                  {
                    n = G.UIT.T,
                    config = {
                      text = localize(text),
                      colour = G.C.UI.TEXT_LIGHT,
                      scale = 0.3
                    }
                  },
                }
              }
            }
          }
        }
      }
    end
  end,

  calculate = function(self, card, context)
    if context.selling_self and not context.blueprint then
      local other_joker = nil
      for i = 1, #G.jokers.cards do
        if G.jokers.cards[i] == card then other_joker = G.jokers.cards[i + 1] end
      end
      if other_joker ~= nil then
        other_joker:set_eternal(true)
      end
    end
  end
}
