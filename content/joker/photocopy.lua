SMODS.Joker {
  key = "photocopy",
  rarity = 3,
  pos = { x = 22, y = 3 },
  atlas = "jokers_atlas",
  cost = 10,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,
  unlocked = true,
  loc_vars = function(self, info_queue, card)
    if card.area == G.jokers and G.jokers.cards[#G.jokers.cards] ~= card and G.jokers.cards[#G.jokers.cards].config.center.blueprint_compat then
      card.ability.blueprint_compat = ' ' .. localize('k_compatible') .. ' '
      card.ability.bubble_colour = mix_colours(G.C.GREEN, G.C.JOKER_GREY, 0.8)
    else
      card.ability.blueprint_compat = ' ' .. localize('k_incompatible') .. ' '
      card.ability.bubble_colour = mix_colours(G.C.RED, G.C.JOKER_GREY, 0.8)
    end
    return {
      main_end = (card.area and card.area == G.jokers) and {
        {
          n = G.UIT.C,
          config = { align = "bm", minh = 0.4 },
          nodes = {
            {
              n = G.UIT.C,
              config = { ref_table = card, align = "m", colour = card.ability.bubble_colour, r = 0.05, padding = 0.06 },
              nodes = {
                { n = G.UIT.T, config = { ref_table = card.ability, ref_value = 'blueprint_compat', colour = G.C.UI.TEXT_LIGHT, scale = 0.32 * 0.8 } },
              }
            }
          }
        }
      }
    }
  end,

  calculate = function(self, card, context)
    return SMODS.blueprint_effect(card, G.jokers.cards[#G.jokers.cards], context)
  end
}
