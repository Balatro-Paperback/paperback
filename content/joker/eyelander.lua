SMODS.Joker {
  key = "eyelander",
  config = {
    extra = {
      heads = 0,
      heads_req = 9,
      trigerred = false
    }
  },
  rarity = 3,
  pos = { x = 10, y = 0 },
  atlas = 'jokers_atlas',
  cost = 8,
  unlocked = true,
  discovered = false,
  blueprint_compat = false,
  eternal_compat = false,
  perishable_compat = true,
  loc_vars = function(self, info_queue, card)
    return {
      vars = { card.ability.extra.heads_req, card.ability.extra.heads }
    }
  end,

  -- Dear Jimbo in heaven, when will this joker stop being problematic
  calculate = function(self, card, context)
    if context.destroy_card and context.cardarea == G.play and not context.blueprint then
      if context.destroy_card:is_face() then
        if card.ability.extra.heads <= card.ability.extra.heads_req then
          card.ability.extra.heads = card.ability.extra.heads + 1
          return {
            remove = true,
          }
        else
          if not card.ability.extra.trigerred then
            card.ability.extra.trigerred = true
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

    if context.selling_self and card.ability.extra.heads >= card.ability.extra.heads_req and not context.blueprint then
      local editionless_jokers = SMODS.Edition:get_edition_cards(G.jokers, true)
      -- this is literally just ectoplasm except we
      -- remove this joker from the available jokers to negative
      for i, v in ipairs(editionless_jokers) do
        if v == card then
          table.remove(editionless_jokers, i)
          break
        end
      end
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
