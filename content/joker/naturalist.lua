SMODS.Joker {
  key = "naturalist",
  config = {
    extra = {
      xmult = 1,
      a_xmult = 0.25
    }
  },
  attributes = {
    'xmult',
    'scaling',
    'ticket',

  },
  rarity = 2,
  pos = { x = 13, y = 13 },
  atlas = "jokers_atlas",
  cost = 6,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = false,
  paperback = {
    requires_tickets = true,
  },

  paperback_credit = {
    coder = { 'dowfrin' }
  },

  in_pool = function(self, args)
    if G.consumeables.cards then
      for _, v in ipairs(G.consumeables.cards) do
        if v.ability.set == 'paperback_ticket' then
          return true
        end
      end
      return false
    end
  end,

  check_for_unlock = function(self, args)
    if args.type == 'discover_amount' then
      if G.P_CENTER_POOLS["paperback_ticket"] then
        local count = 0
        local count2 = 0
        for k, v in pairs(G.P_CENTER_POOLS["paperback_ticket"]) do
          count2 = count2 + 1
          if v.discovered == true then
            count = count + 1
          end
        end
        return count == count2
      end
    end
  end,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.a_xmult,
        card.ability.extra.xmult,
      }
    }
  end,

  calculate = function(self, card, context)
    if context.paperback and context.paperback.ticket_progress then
      SMODS.scale_card(card, {
        ref_table = card.ability.extra,
        ref_value = 'xmult',
        scalar_value = 'a_xmult',
        message_key = 'a_xmult'
      })
      return nil, true
    end

    if context.joker_main then
      return {
        xmult = card.ability.extra.xmult
      }
    end
  end,
}
