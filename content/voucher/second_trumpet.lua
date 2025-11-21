SMODS.Voucher {
  key = 'second_trumpet',
  config = {
    a_slot = 1,
  },
  atlas = 'vouchers_atlas',
  pos = { x = 2, y = 0 },
  unlocked = true,
  discovered = false,
  paperback = {
    requires_ego_gifts = true,
  },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.a_slot or self.config.a_slot
      }
    }
  end,

  redeem = function(self)
    G.GAME.paperback.second_trumpets = G.GAME.paperback.second_trumpets + 1
    SMODS.Centers['v_paperback_second_trumpet']:update_second_trumpet()
  end,

  -- Utility function
  update_second_trumpet = function(self)
    local found_gift = 0
    if G.consumeables then
      for _, v in ipairs(G.consumeables.cards) do
        if PB_UTIL.is_ego_gift(v) then
          found_gift = 1
          break
        end
      end

      local slots = self.config.a_slot * found_gift * G.GAME.paperback.second_trumpets
      local change = slots - G.GAME.paperback.second_trumpet_change
      if change ~= 0 then
        G.consumeables:change_size(change)
        G.GAME.paperback.second_trumpet_change = slots
      end
    end
  end
}

local add_to_deck_ref = Card.add_to_deck
function Card.add_to_deck(self, ...)
  add_to_deck_ref(self, ...)
  if PB_UTIL.is_ego_gift(self) then
    SMODS.Centers['v_paperback_second_trumpet']:update_second_trumpet()
  end
end
local remove_from_deck_ref = Card.remove_from_deck
function Card.remove_from_deck(self, ...)
  remove_from_deck_ref(self, ...)
  if PB_UTIL.is_ego_gift(self) then
    SMODS.Centers['v_paperback_second_trumpet']:update_second_trumpet()
  end
end