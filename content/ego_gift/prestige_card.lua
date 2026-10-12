PB_UTIL.EGO_Gift {
  key = "prestige_card",
  config = {
    sin = 'envy',
    extra = { odds = 10 },
    active = true
  },
  pos = { x = 6, y = 3 },
  soul_pos = { x = 6, y = 7 },
  atlas = "ego_gift_atlas",
  paperback_credit = {
    coder = { 'thermo' },
    artist = { 'papermoonqueen', 'ari' }
  },

  ego_loc_vars = function(self, info_queue, card)
    local numerator, denominator = PB_UTIL.chance_vars(card)
    return {
      vars = {
        numerator, denominator
      }
    }
  end,

  ego_gift_calc = function(self, card, context)
    if context.buying_card and card.ability.active and PB_UTIL.chance(card, "prestige_card") then
      card.ability.active = false
      return {
        message = localize('paperback_plus_tag'),
        func = function()
          G.E_MANAGER:add_event(Event({
            func = function()
              PB_UTIL.add_tag(PB_UTIL.poll_tag("spirit_box"))
              return true
            end
          }))
        end
      }
    end
    if context.ending_shop and not card.ability.active then
      card.ability.active = true
    end
  end
}
