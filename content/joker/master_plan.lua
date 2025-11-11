SMODS.Joker {
  key = "master_plan",
  rarity = 3,
  pos = { x = 22, y = 4 },
  atlas = "jokers_atlas",
  cost = 10,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,
  unlocked = false,
  check_for_unlock = function(self, args)
    if args.type == 'win_challenge' and G.GAME.challenge == 'c_city_1' then
      self.challenge_bypass = true
      return true
    end
  end,
  loc_vars = function(self, info_queue, card)
    if card.area and card.area == G.jokers then
      local other_joker
      for i = 1, #G.jokers.cards do
        if G.jokers.cards[i] == card then other_joker = G.jokers.cards[i - 1] end
      end
      local compatible = other_joker and other_joker ~= card and other_joker.config.center.blueprint_compat
      main_end = {
        {
          n = G.UIT.C,
          config = { align = "bm", minh = 0.4 },
          nodes = {
            {
              n = G.UIT.C,
              config = { ref_table = card, align = "m", colour = compatible and mix_colours(G.C.GREEN, G.C.JOKER_GREY, 0.8) or mix_colours(G.C.RED, G.C.JOKER_GREY, 0.8), r = 0.05, padding = 0.06 },
              nodes = {
                { n = G.UIT.T, config = { text = ' ' .. localize('k_' .. (compatible and 'compatible' or 'incompatible')) .. ' ', colour = G.C.UI.TEXT_LIGHT, scale = 0.32 * 0.8 } },
              }
            }
          }
        }
      }
      return { main_end = main_end }
    end
  end,

  calculate = function(self, card, context)
    local other_joker = nil
    for i = 1, #G.jokers.cards do
      if G.jokers.cards[i] == card then other_joker = G.jokers.cards[i - 1] end
    end
    return SMODS.blueprint_effect(card, other_joker, context)
  end,
}
