SMODS.Joker {
  key = "spirit_box",
  config = {
    extra = {
      active = true
    }
  },
  attributes = {
    'tag',
    'generation',
    'hand_type'
  },
  rarity = 2,
  pos = { x = 25, y = 5 },
  atlas = "jokers_atlas",
  cost = 7,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,
  paperback = {

  },
  paperback_credit = {
    coder = { "ThermoDyn" }
  },

  loc_vars = function(self, info_queue, card)
    local hand = G.GAME.paperback.weather_radio_hand
    return {
      vars = {
        localize(hand, 'poker_hands'),
      }
    }
  end,

  calculate = function(self, card, context)
    if context.first_hand_drawn and not context.blueprint_card then
      local eval = function() return card.ability.extra.active and not G.RESET_JIGGLES end
      juice_card_until(card, eval, true)
    end
    if context.before and card.ability.extra.active and next(context.poker_hands[G.GAME.paperback.weather_radio_hand]) then
      card.ability.extra.active = false
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
  end
}
