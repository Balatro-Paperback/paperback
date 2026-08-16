SMODS.Joker {
  key = 'shopping_center',
  attributes = {
    'passive'
  },
  rarity = 1,
  pos = { x = 7, y = 1 },
  atlas = 'jokers_atlas',
  cost = 6,
  unlocked = true,
  discovered = false,
  blueprint_compat = false,
  eternal_compat = true,
  soul_pos = nil,

  paperback_credit = {
    coder = { 'oppositewolf' }
  },

  check_for_unlock = function (self, args)
    return G.GAME.shop.joker_max >= 4
  end,

  locked_loc_vars = function(self, info_queue, card)
    local other_name = localize('k_unknown')
    if G.P_CENTERS['b_paperback_paper'].unlocked then
      other_name = localize { type = 'name_text', set = 'Back', key = 'b_paperback_paper' }
    end

    return {
      vars = { 4, other_name }
    }
  end,

  -- On Joker spawn, add additional slot in shop
  add_to_deck = function(self, card, from_debuff)
    G.E_MANAGER:add_event(Event({
      func = function()
        change_shop_size(1)
        return true
      end
    }))
  end,

  -- On Joker despawn, remove the additional slot in shop
  remove_from_deck = function(self, card, from_debuff)
    G.GAME.shop.joker_max = G.GAME.shop.joker_max - 1
  end
}
