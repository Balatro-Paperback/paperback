SMODS.Joker {
  key = 'normalJKR',
  rarity = 1,
  pos = { x = 23, y = 12 },
  atlas = 'jokers_atlas',
  cost = 6,
  unlocked = true,
  discovered = false,
  blueprint_compat = false,
  eternal_compat = true,
  perishable_compat = true,
  config = { extra = { } },
  attributes = {
    'economy',
  },

  paperback_credit = {
    coder = { 'dowfrin' }
  },

  -- Alt Description
  loc_vars = function(self, info_queue, card)
      return {
        key = math.random() > 0.063 and "j_paperback_normalJKR" or "j_paperback_normalJKR_alt"
      }
  end,


  -- Alt Name
  generate_ui = function(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
    full_UI_table.name = localize { type = 'name', set = "Joker",
      key = math.random() > 0.063 and "j_paperback_normalJKR" or "j_paperback_normalJKR_alt"
      , nodes = {}
    }
    return SMODS.Center.generate_ui(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
  end,

  add_to_deck = function (self, card, from_debuff)
    if G.STATE == G.STATES.SHOP then
      G.GAME.paperback.free_purchases = G.GAME.paperback.free_purchases + 1
    end

    PB_UTIL.refresh_shop_cost()
  end,

  remove_from_deck = function (self, card, from_debuff)
    G.GAME.paperback.free_purchases = math.max(0, G.GAME.paperback.free_purchases - 1)

    PB_UTIL.refresh_shop_cost()
  end
}

local set_cost_ref = Card.set_cost
function Card.set_cost(self)
  local ret = set_cost_ref(self)
  
  if G.GAME.paperback.free_purchases and G.GAME.paperback.free_purchases > 0 and not (self.ability.set == "Voucher" or self.ability.set == "Booster") then
    self.cost = 0
    self.sell_cost = math.max(1, math.floor(self.cost/2)) + (self.ability.extra_value or 0)
  end
  
  return ret
end