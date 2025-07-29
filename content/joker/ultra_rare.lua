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
      for _, v in ipairs(card.ability.extra.rarities) do
        G.E_MANAGER:add_event(Event {
          func = function()
            local c = SMODS.add_card {
              set = 'Joker',
              rarity = v,
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
