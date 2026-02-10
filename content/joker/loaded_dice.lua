SMODS.Joker {
  key = "loaded_dice",
  config = {
    extra = {
      a_odds = 1,
      triggered = nil,
      suit = "paperback_Crowns"
    }
  },
  rarity = 1,
  pos = { x = 25, y = 6 },
  atlas = "jokers_atlas",
  cost = 6,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,
  paperback_credit = {
    coder = { 'thermo' }
  },
  paperback = {
    requires_crowns = true
  },

  loc_vars = function(self, info_queue, card)
    return { vars = { PB_UTIL.force_signed(card.ability.extra.a_odds), localize(card.ability.extra.suit, 'suits_singular') } }
  end,

  calculate = function(self, card, context)
    if context.blueprint then return end

    if context.before then
      if G.GAME.paperback.hand_contained_crown then
        card.ability.extra.triggered = true
      end
    end

    if context.mod_probability and card.ability.extra.triggered then
      return {
        numerator = context.numerator + card.ability.extra.a_odds,
      }
    end

    if context.after then
      card.ability.extra.triggered = nil
    end
  end
}
