SMODS.Joker {
  key = 'full_moon',
  config = {
    extra = {
      odds = 3
    }
  },
  rarity = 2,
  pos = { x = 5, y = 9 },
  atlas = 'jokers_atlas',
  cost = 7,
  unlocked = true,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,

  loc_vars = function(self, info_queue, card)
    local numerator, denominator = PB_UTIL.chance_vars(card)

    return {
      vars = {
        numerator,
        denominator
      }
    }
  end,

  calculate = function(self, card, context)
    if context.using_consumeable and context.consumeable.ability.set == 'Planet' then
      local hand = context.consumeable.ability.hand_type
      local eff_card = context.blueprint_card or card

      if hand and PB_UTIL.chance(card, 'full_moon') then
        -- This is a copy of how a planet card sets the text when upgrading a hand (just formatted better)
        update_hand_text(
          { sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3 },
          {
            handname = localize(hand, 'poker_hands'),
            chips = G.GAME.hands[hand].chips,
            mult = G.GAME.hands[hand].mult,
            level = G.GAME.hands[hand].level
          }
        )

        G.E_MANAGER:add_event(Event {
          func = function()
            eff_card:juice_up()
            return true
          end
        })

        level_up_hand(context.consumeable or eff_card, hand)

        update_hand_text(
          { sound = 'button', volume = 0.7, pitch = 1.1, delay = 0 },
          { mult = 0, chips = 0, handname = '', level = '' }
        )

        return nil, true
      end
    end
  end
}
