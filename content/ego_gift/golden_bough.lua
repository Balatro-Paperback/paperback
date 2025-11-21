PB_UTIL.EGO_Gift {
  key = 'golden_bough',
  config = {
    sin = 'madness',
    delta = -1,
  },
  atlas = 'ego_gift_atlas',
  pos = { x = 7, y = 2 },
  soul_pos = { x = 7, y = 5 },

  hidden = true,
  set = 'Spectral',
  soul_set = "paperback_ego_gift",
  soul_rate = 0.001,

  ego_loc_vars = function(self, info_queue, card)
    return { vars = {
      card.ability.delta
    } }
  end,

  ego_gift_calc = function(self, card, context)
    if context.end_of_round and G.GAME.blind.boss and context.cardarea == G.consumeables then
      local key
      local filtered, gifts = {}, {}
      for k, v in ipairs(PB_UTIL.ENABLED_EGO_GIFTS) do
        if v ~= gifts[#gifts] and v ~= gifts[#gifts - 1] then
          v = 'c_paperback_' .. v
          gifts[#gifts + 1] = v
        end
      end

      for k, v in ipairs(G.consumeables) do
        if v.ability.set == 'paperback_ego_gift' then
          for _, name in ipairs(gifts) do
            if v.config.center.key == name then
              table.remove(gifts, _)
            end
          end
        end
      end


      if #gifts > 0 then
        key = pseudorandom_element(gifts, pseudoseed("golden_bough_spawn"))
      else
        key = 'c_paperback_dark_vestige'
      end

      local new_gift = SMODS.create_card {
        key = key,
        edition = 'e_negative'
      }
      new_gift:add_to_deck()
      G.consumeables:emplace(new_gift)
    end
  end,

  ego_add = function(self, card, from_debuff)
    G.jokers:change_size(card.ability.delta)
  end,

  ego_remove = function(self, card, from_debuff)
    G.jokers:change_size(-card.ability.delta)
  end
}
