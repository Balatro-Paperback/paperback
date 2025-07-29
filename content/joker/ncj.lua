SMODS.Joker {
  key = "ncj",
  rarity = 1,
  pos = { x = 15, y = 5 },
  atlas = "jokers_atlas",
  config = {
    extra = {
      scaling = 4
    }
  },
  pools = {
    Music = true
  },
  cost = 5,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,

  loc_vars = function(self, info_queue, card)
    local sell_cost = 0

    if G.jokers then
      for _, v in ipairs(G.jokers.cards) do
        if v ~= card then
          sell_cost = sell_cost + v.sell_cost
        end
      end
    end

    return {
      vars = {
        card.ability.extra.scaling,
        math.max(0, sell_cost * card.ability.extra.scaling)
      }
    }
  end,

  calculate = function(self, card, context)
    if context.joker_main then
      local sell_cost = 0

      for _, v in ipairs(G.jokers.cards) do
        if v ~= card then
          sell_cost = sell_cost + v.sell_cost
        end
      end

      return {
        chips = math.max(0, sell_cost * card.ability.extra.scaling)
      }
    end
  end
}
