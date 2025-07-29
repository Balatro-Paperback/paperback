SMODS.Joker {
  key = "alert",
  config = {
    extra = {
      current = 0,
      max = 3
    }
  },
  pools = {
    Music = true
  },
  rarity = 2,
  pos = { x = 3, y = 7 },
  atlas = 'jokers_atlas',
  cost = 4,
  unlocked = true,
  discovered = false,
  blueprint_compat = false,
  eternal_compat = false,
  soul_pos = { x = 4, y = 7 },
  yes_pool_flag = 'paperback_alert_can_spawn',

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.current,
        card.ability.extra.max
      }
    }
  end,

  calculate = function(self, card, context)
    if not context.blueprint and context.destroying_card and #context.full_hand == 1 then
      if context.destroying_card:is_face(true) then
        if card.ability.extra.current < card.ability.extra.max then
          -- If played hand is a single face card and the destroyed amount is
          -- less than the limit, destroy it and increase the count
          card.ability.extra.current = card.ability.extra.current + 1

          local ret = {
            remove = true,
            focus = card,
            message = localize {
              type = 'variable',
              key = 'paperback_a_completion',
              vars = {
                card.ability.extra.current,
                card.ability.extra.max
              },
              colour = G.C.UI.TEXT_INACTIVE
            },
            colour = G.C.UI.BACKGROUND_INACTIVE
          }

          if card.ability.extra.current >= card.ability.extra.max then
            -- Destroy this joker and create Legacy
            PB_UTIL.destroy_joker(card, function()
              -- Remove Alert from the pool
              G.GAME.pool_flags.paperback_alert_can_spawn = false

              SMODS.add_card {
                key = 'j_paperback_legacy',
                edition = card.edition
              }
            end)

            -- Modify the message
            ret.message = localize('paperback_destroyed_ex')
            ret.colour = G.C.MULT
          end

          return ret
        end
      end
    end
  end,

  joker_display_def = function(JokerDisplay)
    return {
      extra = {
        {
          ref_table = "card.joker_display_values",
          ref_value = "active"
        }
      },
      reminder_text = {
        {
          text = "("
        },
        {
          ref_table = "card.ability.extra",
          ref_value = "current",
        },
        {
          text = "/",
        },
        {
          ref_table = "card.ability.extra",
          ref_value = "max",
        },
        {
          text = ")"
        }
      },
      reminder_text_config = {
        colour = G.C.UI.TEXT_INACTIVE,
        scale = 0.35
      },

      calc_function = function(card)
        local hand = next(G.play.cards) and G.play.cards or G.hand.highlighted
        local text, _, scoring_hand = JokerDisplay.evaluate_hand(hand)

        card.joker_display_values.active = (#scoring_hand == 1 and scoring_hand[1]:is_face()) and localize('k_active') or
            localize('paperback_inactive')
      end,

      style_function = function(card, text, reminder_text, extra)
        if text and text.children[1] then
          text.children[1].config.colour = card.joker_display_values.active == localize('k_active') and G.C.GREEN or
              G.C.UI.TEXT_INACTIVE
        end
      end,
    }
  end,
}
