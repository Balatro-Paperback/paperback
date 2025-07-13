SMODS.Joker {
  key = "apple",
  config = {
    extra = {
      odds = 4,
    }
  },
  rarity = 1,
  pos = { x = 6, y = 6 },
  atlas = 'jokers_atlas',
  cost = 1,
  unlocked = true,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = false,
  perishable_compat = true,
  soul_pos = { x = 7, y = 6 },
  pools = {
    Food = true
  },

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.e_negative
    local numerator, denominator = PB_UTIL.chance_vars(card)

    return {
      vars = {
        numerator,
        denominator
      }
    }
  end,

  calculate = function(self, card, context)
    -- Only trigger on bought consumables
    if context.buying_card and context.card.ability.consumeable then
      local bought_card = context.card

      if PB_UTIL.chance(card, 'apple_creation') then
        -- Copy the consumable
        G.E_MANAGER:add_event(Event({
          trigger = 'after',
          func = function()
            -- Give the negative consumable
            local copy = copy_card(bought_card)
            copy:add_to_deck()
            copy:set_edition('e_negative', true)
            G.consumeables:emplace(copy)

            return true
          end
        }))

        -- Don't destroy the joker if it was triggered due to blueprint
        if not context.blueprint then
          PB_UTIL.destroy_joker(card)

          return {
            message = localize('paperback_destroyed_ex'),
            colour = G.C.MULT
          }
        end

        -- To allow this joker to be retriggered
        return nil, true
      end
    end
  end,
}
