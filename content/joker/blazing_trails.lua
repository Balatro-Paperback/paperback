SMODS.Joker {
  key = "blazing_trails",
  config = {
    extra = {
      required_cards = 5,
    }
  },
  attributes = {
    'discard',
    'destroy_cards',
    'red'
  },

  rarity = 2,
  pos = { x = 4, y = 12 },
  atlas = "jokers_atlas",
  cost = 6,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,
  unlocked = false,

  paperback_credit = {
    coder = { 'dowfrin' }
  },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.required_cards,
      }
    }
  end,

  check_for_unlock = function(self, args)
    if (G.GAME.paperback.destroyed_cards.suits["paperback_Stars"] or 0) >= 1 then
      return true
    end
  end,

  calculate = function(self, card, context)
    -- Mark the rightmost card not already destroyed by this
    if context.pre_discard and #context.full_hand == card.ability.extra.required_cards then
      local to_destroy = nil

      for _, v in ipairs(context.full_hand) do
        if not v.paperback_blazing_marked then
          to_destroy = v
        end
      end

      if to_destroy then
        to_destroy.paperback_blazing_marked = true
      end
    end

    -- Actually destroy the marked cards
    if context.discard and context.other_card.paperback_blazing_marked then
      return {
        remove = true
      }
    end
  end
}
