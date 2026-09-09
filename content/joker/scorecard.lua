SMODS.Joker {
  key = "scorecard",
  config = {
    extra = {
      suit = "Clubs", req = 9, current = 9, mult = 0
    }
  },
  attributes = {
    "mult", "scaling", "sell_value", "clubs", "suit"
  },
  rarity = 2,
  unlocked = false,
  pos = { x = 3, y = 13 },
  atlas = "jokers_atlas",
  cost = 7,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = false,
  paperback = {

  },
  paperback_credit = {
    coder = { 'dowfrin' }
  },
  check_for_unlock = function(self, args)
    return args.type == 'ante_up' and args.ante == 10
  end,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.req,
        card.ability.extra.current,
        localize(card.ability.extra.suit, 'suits_plural'),
        card.ability.extra.mult,
        colours = { G.C.SUITS[card.ability.extra.suit] }

      }
    }
  end,

  calculate = function(self, card, context)
    if not context.blueprint and context.discard and not context.other_card.debuff and context.other_card:is_suit(card.ability.extra.suit) then
      card.ability.extra.current = card.ability.extra.current - 1
      if card.ability.extra.current == 0 then
        if #G.jokers.cards > 1 then
          local target = pseudorandom_element(G.jokers.cards, 'scorecard_select_scale',
            { in_pool = function(v, args) return v ~= card end })
          SMODS.scale_card(card, {
            ref_table = card.ability.extra,
            ref_value = 'mult',
            scalar_table = target,
            scalar_value = 'sell_cost',
            operation = '+'
          })
          card.ability.extra.current = card.ability.extra.req
        end
      end
      return nil, true
    end

    if context.joker_main then
      return {
        mult = card.ability.extra.mult
      }
    end
  end
}
