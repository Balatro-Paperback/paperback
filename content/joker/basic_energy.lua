SMODS.Joker {
  key = "basic_energy",
  config = {
    extra = {
      odds = 4
    }
  },
  rarity = 2,
  pos = { x = 1, y = 6 },
  atlas = 'jokers_atlas',
  cost = 6,
  unlocked = true,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,
  soul_pos = nil,

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
    -- Check that the card being consumed is not a copy made by this joker
    if context.using_consumeable and not context.consumeable.ability.paperback_energized then
      if PB_UTIL.chance(card, 'basic_energy') then
        local eff_card = context.blueprint_card or card
        local consumable = context.consumeable

        G.E_MANAGER:add_event(Event {
          func = function()
            if #G.consumeables.cards < G.consumeables.config.card_limit then
              local copy = copy_card(consumable)
              copy:add_sticker('paperback_energized', true)
              copy:add_to_deck()
              G.consumeables:emplace(copy)

              -- Display a copy message, using the color of the set of the card being copied if possible
              SMODS.calculate_effect({
                message = localize("paperback_copy_ex"),
                colour = G.C.SECONDARY_SET[context.consumeable.ability.set] or G.C.GREEN,
                instant = true
              }, eff_card)
            end
            return true
          end
        })
        delay(0.6)

        return nil, true
      end
    end
  end,

  joker_display_def = function(JokerDisplay)
    return {
      extra = {
        {
          { text = "(" },
          { ref_table = 'card.joker_display_values', ref_value = 'odds' },
          { text = ")" }
        }
      },
      extra_config = {
        colour = G.C.GREEN,
        scale = 0.3,
      },

      calc_function = function(card)
        card.joker_display_values.odds = localize { type = 'variable', key = 'jdis_odds', vars = { PB_UTIL.chance_vars(card) } }
      end,
    }
  end
}
