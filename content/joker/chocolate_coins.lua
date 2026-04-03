SMODS.Joker {
  key = 'chocolate_coins',
  config = {
    extra = {
      dollars = 8,
      eaten = 2
    }
  },
  attributes = {
    'economy',
    'food'
  },
  rarity = 1,
  pos = { x = 3, y = 11 },
  atlas = 'jokers_atlas',
  cost = 6,
  unlocked = true,
  discovered = false,
  blueprint_compat = false,
  eternal_compat = false,
  perishable_compat = true,
  pools = {
    Food = true
  },
  paperback_credit = {
    coder = { 'thermo' }
  },

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.dollars, card.ability.extra.eaten } }
  end,

  calculate = function(self, card, context)
    if context.starting_shop and context.cardarea == G.jokers then
      card.ability.extra.enabled = true
      card.ability.extra.dollars = card.ability.extra.dollars - card.ability.extra.eaten
      if card.ability.extra.dollars <= 0 then
        PB_UTIL.destroy_joker(card)
        return {
          message = localize('k_eaten_ex'),
          colour = G.C.FILTER
        }
      end
    end
  end,

  calc_dollar_bonus = function(self, card)
    return card.ability.extra.dollars
  end
}
