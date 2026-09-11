SMODS.Joker {
  key = "nigiri",
  config = {
    extra = {
      xmult = 1,
      factor = 100
    }
  },
  attributes = {
    'scaling',
    'discard',
    'food',
    'rank',
    'xmult',
    'red'
  },
  rarity = 3,
  pos = { x = 1, y = 12 },
  atlas = "jokers_atlas",
  cost = 6,
  blueprint_compat = true,
  eternal_compat = false,
  perishable_compat = true,
  unlocked = false,

  pools = {
    Food = true
  },

  paperback_credit = {
    coder = { 'dowfrin' }
  },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.xmult,
        card.ability.extra.factor
      }
    }
  end,

  calculate = function(self, card, context)
    if context.discard and not context.blueprint then
      if not SMODS.has_no_rank(context.other_card) then
        SMODS.scale_card(card, {
          ref_table = card.ability.extra,
          ref_value = 'xmult',
          scalar_table = context.other_card.base,
          scalar_value = 'nominal',
          scalar_factor = 1 / card.ability.extra.factor,
          operation = '+',
          message_key = 'a_xmult',
          message_colour = G.C.RED
        })
      end
    end

    if context.individual and context.cardarea == G.play and context.other_card:is_face() then
      PB_UTIL.destroy_joker(card)
      return {
        message = localize('k_eaten_ex'),
        colour = G.C.FILTER,
        card = card
      }
    end

    if context.end_of_round and context.main_eval and G.GAME.blind and G.GAME.blind.boss then
      card.ability.extra.xmult = 1
      return {
        message = localize('k_reset')
      }
    end

    if context.joker_main then
      return {
        xmult = card.ability.extra.xmult
      }
    end
  end,
}
