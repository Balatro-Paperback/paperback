SMODS.Joker {
  key = 'rosary_beads',
  unlocked = true,
  discovered = false,
  config = {
    extra = {
      hearts = 3,
      dollars = 5
    }
  },
  atlas = "jokers_atlas",
  rarity = 1,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,
  cost = 4,
  pos = { x = 13, y = 9 },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.hearts, card.ability.extra.dollars } }
  end,
  calculate = function(self, card, context)

    if context.joker_main then
      local hearts = 0
      for _, v in ipairs(G.play.cards) do
        if v:is_suit('Hearts', false, true) then
          hearts = hearts + 1
        end
      end
      if hearts >= card.ability.extra.hearts then
        return { dollars = card.ability.extra.dollars }
      end
    end
  end
}
