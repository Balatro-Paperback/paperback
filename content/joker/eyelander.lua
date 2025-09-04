SMODS.Joker {
  key = "eyelander",
  config = {
    extra = {
      heads = 0,
      heads_req = 9
    }
  },
  rarity = 3,
  pos = { x = 10, y = 0 },
  atlas = 'jokers_atlas',
  cost = 8,
  unlocked = true,
  discovered = false,
  blueprint_compat = false,
  eternal_compat = true,
  perishable_compat = true,
  loc_vars = function(self, info_queue, card)
    return {
      vars = { card.ability.extra.heads_req, card.ability.extra.heads }
    }
  end,

  calculate = function(self, card, context)
    if context.destroy_card then
      for _, c in ipairs(G.play.cards) do
        if c:is_face() and context.destroy_card == c then
          card.ability.extra.heads = card.ability.extra.heads + 1
          if card.ability.extra.heads < card.ability.extra.heads_req then
            return {
              remove = true,
              --[[ If a message is decided upon
              message = localize(),
              colour = G.C.RED
              ]]
            }
          else
            juice_card_until(card, function() return true end, true)
            return {
              remove = true,
              message = localize('k_active_ex'),
              colour = G.C.ORANGE
            }
          end
        end
      end
    end

    if context.selling_self and card.ability.extra.heads >= card.ability.extra.heads_req then
      local editionless_jokers = SMODS.Edition:get_edition_cards(G.jokers, true)
      -- this is literally just ectoplasm except we
      -- remove this joker from the available jokers to negative
      table.remove(editionless_jokers, editionless_jokers[card])
      if next(editionless_jokers) then
        G.E_MANAGER:add_event(Event({
          trigger = 'immediate',
          delay = 0.4,
          func = function()
            local eligible_card = pseudorandom_element(editionless_jokers, 'THERE CAN ONLY BE ONE, EYE')
            eligible_card:set_edition({ negative = true })
            eligible_card:juice_up(0.3, 0.5)
            return true
          end
        }))
      end
    end
  end
}
