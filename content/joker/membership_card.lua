SMODS.Joker {
  key = 'membership_card',
  rarity = 2,
  pos = { x = 18, y = 11 },
  atlas = 'jokers_atlas',
  cost = 8,
  unlocked = true,
  discovered = false,
  blueprint_compat = false,
  eternal_compat = true,
  perishable_compat = true,
  config = { extra = { discount = 0.5 } },
  attributes = {
    'economy',
  },

  paperback_credit = {
    coder = { 'Dowfrin' }
  },

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.discount * 100 } }
  end,

  add_to_deck = function (self, card, from_debuff)
    G.E_MANAGER:add_event(Event({func = function()
      for k, v in pairs(G.I.CARD) do
        if v.set_cost then v:set_cost() end
      end
      return true end }))
  end,

  remove_from_deck = function (self, card, from_debuff)
  G.E_MANAGER:add_event(Event({func = function()
    for k, v in pairs(G.I.CARD) do
      if v.set_cost then v:set_cost() end
    end
    return true end }))
  end
}

local set_cost_ref = Card.set_cost
function Card.set_cost(self)
  local cards = SMODS.find_card('j_paperback_membership_card', false)

  local discount = 0

  for k, v in ipairs(cards) do
    if discount == 0 then
      discount = v.ability.extra.discount
    else
      discount = discount * v.ability.extra.discount
    end
  end
  
  set_cost_ref(self)
  
  if discount ~= 0 then
    self.cost = math.max(1, math.floor((self.base_cost + self.extra_cost + 0.5)*(100-G.GAME.discount_percent)/100*(discount)))
    self.sell_cost = math.max(1, math.floor(self.cost/2)) + (self.ability.extra_value or 0)
  end
  
  return ret
end