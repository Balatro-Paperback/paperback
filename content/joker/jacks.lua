SMODS.Joker {
  key = "jacks",
  config = {
    extra = {
      mult = 0,
      change = 1,
      rank = "Jack"
    }
  },
  attributes = {
    'mult',
    'scaling',
    'discard',
    'rank',
    'jack',
    'red'
  },
  rarity = 1,
  pos = { x = 24, y = 8 },
  atlas = "jokers_atlas",
  cost = 5,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = false,
  paperback_credit = {
    coder = { 'thermo' }
  },
  unlocked = false,

  check_for_unlock = function(self, args)
    if args.type == 'win_no_hand' then
      if not G.GAME.paperback.ranks_scored_this_run[11] then
        return true
      end
    end
  end,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.change,
        card.ability.extra.mult,
        card.ability.extra.rank
      }
    }
  end,

  calculate = function(self, card, context)
    if context.joker_main and card.ability.extra.mult > 0 then
      return {
        mult = card.ability.extra.mult
      }
    end
    if not context.blueprint and context.discard and PB_UTIL.is_rank(context.other_card, card.ability.extra.rank) and not context.other_card.debuff then
      SMODS.scale_card(card, {
        ref_table = card.ability.extra,
        ref_value = 'mult',
        scalar_value = 'change'
      })
      return nil, true
    end
  end
}
