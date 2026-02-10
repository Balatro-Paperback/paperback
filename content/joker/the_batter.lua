SMODS.Joker {
  key = "the_batter",
  config = {
    extra = {
      current = 0,
      max = 6,
      rank = "3"
    },
  },
  rarity = 2,
  pos = { x = 20, y = 4 },
  atlas = 'jokers_atlas',
  cost = 4,
  unlocked = true,
  discovered = false,
  blueprint_compat = false,
  eternal_compat = false,
  paperback_credit = {
    artist = { 'dylan_hall' },
    coder = { 'dowfrin' }
  },
  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.current,
        card.ability.extra.max,
        card.ability.extra.rank
      }
    }
  end,

  calculate = function(self, card, context)
    if not context.blueprint and context.destroying_card and context.cardarea == G.play then
      if PB_UTIL.is_rank(context.destroying_card, card.ability.extra.rank) then
        if card.ability.extra.current < card.ability.extra.max then
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
            -- Destroy this joker and create OFF Switch
            PB_UTIL.destroy_joker(card, function()
              SMODS.add_card {
                key = 'j_paperback_off_switch',
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
        card.joker_display_values.active = localize('paperback_inactive')
        for i, v in ipairs(scoring_hand) do
          if PB_UTIL.is_rank(v, card.ability.extra.rank) then
            card.joker_display_values.active = localize('k_active')
            break
          end
        end
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
