SMODS.Joker {
  key = "one_shift_more",
  config = {
    extra = {
      current = 0,
      required = 7,
      suit = "Hearts",
      odd = true,
      x_mult = 1,
      a_xmult = 0.25
    }
  },
  attributes = {
    'xmult',
    'scaling',
    'suit',
    'hearts',
    'music'
  },
  pools = {
    Music = true
  },
  rarity = 2,
  pos = { x = 25, y = 0 },
  atlas = 'jokers_atlas',
  cost = 7,
  unlocked = true,
  discovered = false,
  blueprint_compat = true,
  perishable_compat = false,
  eternal_compat = true,

  paperback_credit = {
    coder = { 'dowfrin' }
  },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.a_xmult,
        card.ability.extra.required,
        card.ability.extra.current,
        card.ability.extra.x_mult,
        localize(card.ability.extra.suit, 'suits_singular')
      }
    }
  end,

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play and not context.blueprint then
      if context.other_card:is_suit(card.ability.extra.suit) then
        card.ability.extra.current = card.ability.extra.current + 1

        if card.ability.extra.current >= card.ability.extra.required then
          card.ability.extra.current = 0
          local key = 'paperback_one_shift_more_' .. tostring(card.ability.extra.odd)
          card.ability.extra.odd = not card.ability.extra.odd
          SMODS.scale_card(card, {
            ref_table = card.ability.extra,
            ref_value = 'x_mult',
            scalar_value = 'a_xmult',
            scaling_message = {
              message = localize(key),
              colour = G.C.MULT,
              message_card = card
            }
          })
          return nil, true
        end
      end
    end

    if context.joker_main then
      return {
        x_mult = card.ability.extra.x_mult
      }
    end
  end
}
