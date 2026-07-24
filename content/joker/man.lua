SMODS.Joker {
  key = "man",
  config = {
    extra = {
      perma_mult = 1
    }
  },
  attributes = {
    'red',
    'perma_bonus',
    'modify_card',
    'mult',
    'suit',
    'dark'
  },
  rarity = 2,
  pos = { x = 6, y = 13 },
  atlas = "jokers_atlas",
  cost = 7,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,
  paperback = {

  },
  paperback_credit = {
    coder = { 'thermo' }
  },

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = PB_UTIL.suit_tooltip('dark')
    return {
      vars = {
        card.ability.extra.perma_mult
      }
    }
  end,

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play and PB_UTIL.is_suit(context.other_card, 'dark', false) then
      context.other_card.ability.perma_mult = (
        context.other_card.ability.perma_mult or 0
      ) + card.ability.extra.perma_mult
      return {
        message = localize('k_upgrade_ex'),
        colour = G.C.MULT
      }
    end
  end
}
