SMODS.Joker {
  key = "coin_collection",
  config = {
    extra = {
      dollars = 1
    }
  },
  attributes = {
    'economy'
  },
  rarity = 1,
  pos = { x = 7, y = 11 },
  atlas = "jokers_atlas",
  cost = 6,

  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,
  paperback_credit = {
    coder = { 'thermo' }
  },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.dollars
      }
    }
  end,

  calculate = function(self, card, context)
    if not G.GAME.paperback.coin_collection_adding_money and context.money_altered and to_number(context.amount) > 0 then
      G.GAME.paperback.coin_collection_adding_money = true
      return {
        dollars = card.ability.extra.dollars,
        func = function()
          G.GAME.paperback.coin_collection_adding_money = false
        end
      }
    end
  end
}
