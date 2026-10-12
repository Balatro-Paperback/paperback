SMODS.Joker {
  key = "attacking_vertical",
  config = {
    extra = {
      ranks = { 9, 5 },
      xm = 1.25,
      change = 0.25
    }
  },
  attributes = {
    'xmult',
    'scaling',
    'rank',
    'nine',
    'five',
    'music'
  },
  pools = {
    Music = true
  },
  rarity = 3,
  pos = { x = 8, y = 11 },
  atlas = "jokers_atlas",
  cost = 8,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = false,
  paperback_credit = {
    coder = { 'thermo' }
  },
  unlocked = false,

  locked_loc_vars = function (self, info_queue, card)
    return { vars = { 10 }}
  end,

  check_for_unlock = function (self, args)
    return G.GAME.paperback.round.ranks_scored and 
    ((G.GAME.paperback.round.ranks_scored[9] or 0) + (G.GAME.paperback.round.ranks_scored[5] or 0)) >= 10
  end,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.ranks[1],
        card.ability.extra.ranks[2],
        card.ability.extra.xm,
        card.ability.extra.change
      }
    }
  end,

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      if context.other_card:get_id() == card.ability.extra.ranks[1] or context.other_card:get_id() == card.ability.extra.ranks[2] then
        return {
          xmult = card.ability.extra.xm
        }
      end
    end
    if context.end_of_round and context.main_eval and context.beat_boss and not context.blueprint then
      SMODS.scale_card(card, {
        ref_table = card.ability.extra,
        ref_value = 'xm',
        scalar_value = 'change',
        message_colour = G.C.MULT
      })
      return nil, true
    end
  end
}
