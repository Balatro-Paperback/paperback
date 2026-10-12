SMODS.Joker {
  key = "moneyback",
  config = {
    extra = {
      spend = 50,
      spent = 0,
      money = 10,
      spendings = nil
    }
  },
  attributes = {
    'economy'
  },
  rarity = 1,
  pos = { x = 15, y = 13 },
  atlas = "jokers_atlas",
  cost = 6,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,
  unlocked = false,
  paperback_credit = {
    coder = { 'thermo' }
  },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.spend,
        card.ability.extra.spent,
        card.ability.extra.money
      }
    }
  end,

  check_for_unlock = function(self, args)
    if args.type == 'spend_in_one_shop' and args.spent >= 100 then
      unlock_card(self)
    end
  end,

  calculate = function(self, card, context)
    if ((context.buying_card and not context.buying_self) or context.open_booster) then
      if (context.card.cost > 0) then
        card.ability.extra.spendings = context.card.cost
        if not context.blueprint then
          SMODS.scale_card(card, {
            ref_table = card.ability.extra,
            ref_value = 'spent',
            scalar_value = 'spendings',
            message_colour = G.C.MONEY,
            message_key = 'paperback_a_dollars'
          })
        end
        if card.ability.extra.spent >= card.ability.extra.spend then
          if not context.blueprint then
            SMODS.scale_card(card, {
              ref_table = card.ability.extra,
              ref_value = 'spent',
              scalar_value = 'spend',
              operation = '-',
              no_message = true
            })
          end
          return {
            dollars = card.ability.extra.money
          }
        end
        return nil, true
      end
    end

    if context.reroll_shop and (context.cost > 0) then
      card.ability.extra.spendings = context.cost
      if not context.blueprint then
        SMODS.scale_card(card, {
          ref_table = card.ability.extra,
          ref_value = 'spent',
          scalar_value = 'spendings',
          message_colour = G.C.MONEY,
          message_key = 'paperback_a_dollars'
        })
      end
      if card.ability.extra.spent >= card.ability.extra.spend then
        if not context.blueprint then
          SMODS.scale_card(card, {
            ref_table = card.ability.extra,
            ref_value = 'spent',
            scalar_value = 'spend',
            operation = '-',
            no_message = true
          })
        end
        return {
          dollars = card.ability.extra.money
        }
      end
      return nil, true
    end
  end
}
