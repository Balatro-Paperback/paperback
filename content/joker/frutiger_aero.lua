SMODS.Joker {
  key = "frutiger_aero",
  config = {
    extra = {
      base = 100,
      chips = 0,
      rate = 2,
      spendings = nil
    }
  },
  attributes = {
    'chips',
    'scaling'
  },
  rarity = 1,
  pos = { x = 21, y = 12 },
  atlas = "jokers_atlas",
  cost = 6,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,
  unlocked = false,

  paperback_credit = {
    coder = { 'dowfrin' }
  },

  check_for_unlock = function(self, args)
    if args.type == 'win' then
      for i, v in ipairs(G.jokers.cards) do
        if v.config.center.rarity == 3 then return false end
      end
      return true
    end
  end,
  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        PB_UTIL.force_signed(card.ability.extra.chips),
        PB_UTIL.force_signed(card.ability.extra.rate)
      }
    }
  end,

  calculate = function(self, card, context)
    if context.end_of_round and context.main_eval and G.GAME.blind.boss and not context.blueprint then
      card.ability.extra.chips = card.ability.extra.base

      return {
        message = localize('k_reset'),
      }
    end

    if (context.buying_card or context.open_booster) and not context.blueprint then
      if (context.card.cost > 0) then
        card.ability.extra.spendings = context.card.cost * card.ability.extra.rate
        SMODS.scale_card(card, {
          ref_table = card.ability.extra,
          ref_value = 'chips',
          scalar_value = 'spendings',
          message_colour = G.C.CHIPS,
          operation = '-',
          message_key = 'a_chips_minus'
        })

        card.ability.extra.chips = math.max(0, card.ability.extra.chips)
        return nil, true
      end
    end

    if context.reroll_shop and (G.GAME.round_resets.reroll_cost > 0) then
      card.ability.extra.spendings = G.GAME.round_resets.reroll_cost * card.ability.extra.rate
      SMODS.scale_card(card, {
        ref_table = card.ability.extra,
        ref_value = 'chips',
        scalar_value = 'spendings',
        message_colour = G.C.CHIPS,
        operation = '-',
        message_key = 'a_chips_minus'
      })

      card.ability.extra.chips = math.max(0, card.ability.extra.chips)
      return nil, true
    end

    if context.joker_main then
      return {
        chips = card.ability.extra.chips
      }
    end
  end,

  set_ability = function(self, card, initial, delay_sprites)
    card.ability.extra.chips = card.ability.extra.base
  end
}
