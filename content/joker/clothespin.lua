SMODS.Joker {
  key = "clothespin",
  config = {
    extra = {
      chips = 14
    }
  },
  rarity = 1,
  pos = { x = 9, y = 9 },
  atlas = "jokers_atlas",
  cost = 6,
  unlocked = true,
  discovered = true,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,
  paperback = {
    requires_paperclips = true
  },

  in_pool = function(self, args)
    for _, v in ipairs(G.playing_cards or {}) do
      if PB_UTIL.has_paperclip(v) then return true end
    end
  end,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.chips,
      }
    }
  end,

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.hand and not context.end_of_round then
      if PB_UTIL.has_paperclip(context.other_card) then
        if context.other_card.debuff then
          return {
            message = localize('k_debuffed')
          }
        else
          return {
            chips = card.ability.extra.chips,
            juice_card = card,
            message_card = context.other_card,
          }
        end
      end
    end
  end
}
