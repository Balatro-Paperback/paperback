SMODS.Joker {
  key = "burning_pact",
  config = {
    extra = {
      required_cards = 1,
      cards = 2,
      active = false
    }
  },
  rarity = 2,
  pos = { x = 10, y = 3 },
  atlas = "jokers_atlas",
  cost = 6,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.required_cards,
        card.ability.extra.cards
      }
    }
  end,

  calculate = function(self, card, context)
    if context.pre_discard and #context.full_hand == card.ability.extra.required_cards and not context.blueprint then
      card.ability.extra.active = true
    end

    if context.paperback and context.paperback.drawing_cards and card.ability.extra.active then
      if not context.blueprint then
        card.ability.extra.active = false
      end

      return {
        draw_extra = card.ability.extra.cards
      }
    end
  end
}
