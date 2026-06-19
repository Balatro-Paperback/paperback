SMODS.Joker {
  key = "ultra_rare",
  config = {
    extra = {
      rarities = {
        'Common',
        'Uncommon',
        'Rare'
      },
      sell_value = 0
    }
  },
  attributes = {
    'generation',
    'joker',
    'rarity',
    'music'
  },
  pools = {
    Music = true
  },
  rarity = 3,
  pos = { x = 10, y = 7 },
  atlas = "jokers_atlas",
  cost = 9,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,
  unlocked = false,
  paperback_credit = {
    coder = { 'srockw' }
  },

  locked_loc_vars = function(self, info_queue, card)
    return { vars = { 3 } }
  end,
  check_for_unlock = function(self, args)
    if args.type == 'modify_jokers' and G.jokers then
      local count = 0

      for i, v in ipairs(G.jokers.cards) do
        if v.edition and v.edition.key == 'e_negative' then count = count + 1 end
      end
      return count >= 3
    end
  end,

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.e_negative
    info_queue[#info_queue + 1] = { set = 'Other', key = 'paperback_temporary' }

    return {
      vars = {
        card.ability.extra.sell_value
      }
    }
  end,

  calculate = function(self, card, context)
    if context.setting_blind then
      for _, rarity in ipairs(card.ability.extra.rarities) do
        local valid_jokers = {}

        for _, v in ipairs(get_current_pool("Joker", rarity)) do
          if v ~= "UNAVAILABLE" then
            valid_jokers[#valid_jokers + 1] = v
          end
        end

        local selected_joker = pseudorandom_element(valid_jokers) or 'j_joker'

        G.E_MANAGER:add_event(Event {
          func = function()
            local c = SMODS.add_card {
              key = selected_joker,
              edition = 'e_negative'
            }

            -- Mark the created Joker as temporary (it will be destroyed at the end of round)
            c:add_sticker('paperback_temporary', true)

            -- Set the sell value of the generated card to 0
            PB_UTIL.set_sell_value(c, card.ability.extra.sell_value)
            return true
          end
        })
      end

      return {
        message = localize('paperback_rare_ex'),
        colour = G.C.MULT
      }
    end
  end
}
