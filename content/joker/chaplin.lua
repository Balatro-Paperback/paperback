SMODS.Joker {
  key = "chaplin",
  rarity = 4,
  pos = { x = 12, y = 1 },
  soul_pos = { x = 13, y = 1 },
  atlas = "jokers_atlas",
  cost = 20,
  blueprint_compat = false,
  eternal_compat = true,
  perishable_compat = true,
  unlocked = false,

  calculate = function(self, card, context)
    if context.buying_card and context.card.ability.set == "Voucher" and not context.blueprint then
      local next_vouchers = {}

      for _, v in ipairs(G.P_CENTER_POOLS.Voucher) do
        local is_upgrade = false
        local add = true

        -- Only include Vouchers that are an upgrade of this one, while also
        -- having its only missing requirement being this one, in vanilla this
        -- will never be relevant, but this is included just in case a
        -- modded voucher has multiple requirements
        if v.requires and type(v.requires) == "table" then
          for _, req in ipairs(v.requires) do
            if req == context.card.config.center_key then
              is_upgrade = true
            else
              add = add and G.GAME.used_vouchers[req]
            end
          end
        end

        if is_upgrade and add then
          next_vouchers[#next_vouchers + 1] = v.key
        end
      end

      -- In cases where more than one voucher is an upgrade, pick a random one
      local voucher = pseudorandom_element(next_vouchers, pseudoseed("chaplin_voucher"))

      if voucher then
        G.E_MANAGER:add_event(Event {
          blocking = false,
          func = function()
            -- Only redeem once the first redeem is over
            if G.STATE == G.STATES.SHOP then
              PB_UTIL.redeem_voucher(voucher)
              card:juice_up()
              return true
            end
          end
        })

        return nil, true
      end
    end
  end
}
