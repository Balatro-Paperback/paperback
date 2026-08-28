SMODS.Joker {
  key = "donor_card",
  config = {
    extra = {
      suit = "Hearts",
      mult = 0,
      a_mult = 1,
      s_chips = 2,
      to_destroy = {},
    }
  },
  attributes = {
    'mult',
    'scaling',
    'destroy_card',
    'modify_card',
    'hearts',
    'red'
  },
  rarity = 2,
  pos = { x = 16, y = 11 },
  atlas = 'jokers_atlas',
  cost = 6,
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
        card.ability.extra.a_mult,
        card.ability.extra.s_chips,
        card.ability.extra.mult,
      }
    }
  end,

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play and context.other_card:is_suit(card.ability.extra.suit) and not context.blueprint_card then
      -- Subtract the chips one at a time
      for i = 1, card.ability.extra.s_chips do
        if context.other_card:get_chip_bonus() > 0 then
          context.other_card.ability.perma_bonus = (context.other_card.ability.perma_bonus or 0) - 1
        end
        if context.other_card:get_chip_bonus() <= 0 then
          if not context.other_card.paperback_donor_done then
            context.other_card.paperback_donor_done = true
            card.ability.extra.to_destroy[#card.ability.extra.to_destroy + 1] = context.other_card
          end
          break
        end
      end

      SMODS.scale_card(card, {
        ref_table = card.ability.extra,
        ref_value = 'mult',
        scalar_value = 'a_mult',
        no_message = true,
      })
      return {
        message = localize {
          type = 'variable',
          key = 'a_mult',
          vars = { card.ability.extra.a_mult }
        },
        message_card = card,
        colour = G.C.MULT
      }
    end

    if context.after and next(card.ability.extra.to_destroy) and not context.blueprint_card then
      SMODS.destroy_cards(card.ability.extra.to_destroy)
      card.ability.extra.to_destroy = {}
    end

    if context.joker_main then
      return {
        mult = card.ability.extra.mult
      }
    end
  end
}
