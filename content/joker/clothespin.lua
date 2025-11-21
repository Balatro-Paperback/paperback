SMODS.Joker {
  key = "clothespin",
  config = {
    extra = {
      a_chips = 15,
      chips = 0
    }
  },
  rarity = 2,
  pos = { x = 9, y = 9 },
  atlas = "jokers_atlas",
  cost = 6,
  unlocked = true,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = false,
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
        card.ability.extra.a_chips,
        card.ability.extra.chips
      }
    }
  end,

  calculate = function(self, card, context)
    if not context.blueprint and context.individual and context.cardarea == G.hand and context.end_of_round then
      if PB_UTIL.has_paperclip(context.other_card) and not context.other_card.debuff then
        card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.a_chips

        return {
          message = localize('k_upgrade_ex'),
          colour = G.C.CHIPS,
          message_card = card,
          juice_card = context.other_card
        }
      end
    end

    if context.joker_main then
      return {
        chips = card.ability.extra.chips
      }
    end
  end,

  joker_display_def = function(JokerDisplay)
    return {
      text = {
        { text = '+',                       colour = G.C.CHIPS },
        { ref_table = 'card.ability.extra', ref_value = 'chips', colour = G.C.CHIPS },
      },
    }
  end
}
