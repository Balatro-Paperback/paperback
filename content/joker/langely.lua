SMODS.Joker {
  key = "langely",
  rarity = 4,
  pos = { x = 12, y = 2 },
  soul_pos = { x = 13, y = 2 },
  atlas = "jokers_atlas",
  cost = 20,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,
  unlocked = false,

  calculate = function(self, card, context)
    if context.end_of_round and context.main_eval and (G.GAME.blind.boss or G.GAME.blind:get_type() == "Big") then
      local money = 0

      for _, v in ipairs(G.jokers.cards) do
        money = money + v.sell_cost
      end

      local dollars = math.max(0, G.GAME.blind.boss and money or math.ceil(money / 2))

      if dollars > 0 then
        return {
          dollars = dollars
        }
      end
    end
  end
}
