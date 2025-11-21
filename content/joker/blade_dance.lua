SMODS.Joker {
  key = "blade_dance",
  config = {
    extra = {
      cards = 3,
      enhancement = 'm_steel'
    }
  },
  rarity = 2,
  pos = { x = 10, y = 2 },
  atlas = "jokers_atlas",
  cost = 6,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.extra.enhancement]
    info_queue[#info_queue + 1] = { set = 'Other', key = 'paperback_temporary' }

    return {
      vars = {
        card.ability.extra.cards,
        localize {
          type = 'name_text',
          set = 'Enhanced',
          key = card.ability.extra.enhancement
        }
      }
    }
  end,

  calculate = function(self, card, context)
    if context.first_hand_drawn then
      local eff_card = context.blueprint_card or card

      G.E_MANAGER:add_event(Event {
        func = function()
          for _ = 1, card.ability.extra.cards do
            SMODS.add_card {
              set = "Base",
              enhancement = card.ability.extra.enhancement,
              stickers = { 'paperback_temporary' },
              area = G.play
            }
          end

          SMODS.calculate_effect({
            message = localize {
              type = 'variable',
              key = 'paperback_a_plus_cards',
              vars = {
                card.ability.extra.cards,
                localize {
                  type = 'name_text',
                  set = 'Enhanced',
                  key = card.ability.extra.enhancement
                }
              }
            },
            instant = true
          }, eff_card)

          for _ = 1, card.ability.extra.cards do
            draw_card(G.play, G.hand, 90, 'up')
          end

          save_run()

          return true
        end
      })
      delay(1)

      return nil, true
    end
  end
}
