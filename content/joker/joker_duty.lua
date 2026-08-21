SMODS.Joker {
  key = "joker_duty",
  config = {
    extra = {
      mult = 0,
      change = 3
    }
  },
  attributes = {
    'mult',
    'scaling',
    'hands',
    'discard'
  },
  rarity = 1,
  pos = { x = 23, y = 1 },
  atlas = "jokers_atlas",
  cost = 6,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,
  paperback_credit = {
    coder = { 'thermo' }
  },
  unlocked = false,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.change,
        card.ability.extra.mult
      }
    }
  end,

  check_for_unlock = function(self, args)
    return args.type == 'round_win' and G.GAME.current_round.hands_left == 0 and
        G.GAME.current_round.discards_left == 0 and
        G.GAME.blind.boss
  end,

  calculate = function(self, card, context)
    if context.joker_main and card.ability.extra.mult > 0 then
      return {
        mult = card.ability.extra.mult
      }
    end
    if not context.blueprint and context.end_of_round and context.main_eval then
      if G.GAME.current_round.discards_left == G.GAME.current_round.hands_left then
        SMODS.scale_card(card, {
          ref_table = card.ability.extra,
          ref_value = 'mult',
          scalar_value = 'change'
        })
        return nil, true
      end
    end
  end
}
