SMODS.Joker {
  key = "park_postcard",
  config = {
    extra = {
      change = 0.2,
      xm = 1
    }
  },
  attributes = {
    'xmult',
    'scaling',
    'reset'
  },
  paperback_credit = {
    coder = { 'thermo' }
  },
  rarity = 3,
  pos = { x = 9, y = 11 },
  atlas = "jokers_atlas",
  cost = 8,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = false,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.change, card.ability.extra.xm
      }
    }
  end,

  calculate = function(self, card, context)
    if context.joker_main and card.ability.extra.xm > 1 then
      return {
        xmult = card.ability.extra.xm
      }
    end
    if context.end_of_round and context.main_eval and not context.blueprint then
      card.ability.extra.xm = card.ability.extra.xm + card.ability.extra.change
      return {
        message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.xm } }
      }
    end
    if context.playing_card_added or context.remove_playing_cards and not context.blueprint then
      card.ability.extra.xm = 1
      return {
        message = localize('k_reset'),
        colour = G.C.ORANGE
      }
    end
  end
}
