SMODS.Joker {
  key = "cardboard_box",
  config = {
    extra = {
      sell_value = 1,
      a_sell_value = 1,
      rank = 'Queen'
    }
  },
  attributes = {
    'sell_value',
    'scaling',
    'queens'
  },
  rarity = 2,
  pos = { x = 15, y = 12 },
  atlas = "jokers_atlas",
  cost = 7,
  blueprint_compat = false,
  eternal_compat = true,
  perishable_compat = true,
  paperback = {

  },
  unlocked = false,
  paperback_credit = {
    coder = { 'thermo' }
  },

  locked_loc_vars = function(self, info_queue, back)
    return {
      vars = {
        localize { type = 'name_text', set = 'Stake', key = 'stake_purple' },
        colours = { get_stake_col(6) },
      }
    }
    end,
  check_for_unlock = function(self, args)
    return args.type == 'win_stake' and get_deck_win_stake() >= 6
  end,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.sell_value,
        card.ability.extra.a_sell_value,
        localize(card.ability.extra.rank, 'ranks'),
      }
    }
  end,

  calculate = function(self, card, context)
    if context.joker_type_destroyed and PB_UTIL.is_food(context.card) then
      SMODS.scale_card(card, {
        ref_table = card.ability.extra,
        ref_value = 'sell_value',
        scalar_value = 'a_sell_value',
        scaling_message = {
          message = localize('k_upgrade_ex'),
          message_card = card,
        }
      })
    end
    if context.before and G.GAME.current_round.hands_played == 0 and not context.blueprint then
      local scored_queen = false
      for _, scored_card in ipairs(context.scoring_hand) do
        if PB_UTIL.is_rank(scored_card, card.ability.extra.rank) then
          scored_queen = true
          break
        end
      end
      if not scored_queen then
        return
      end
      for _, v in ipairs(G.jokers.cards) do
        PB_UTIL.modify_sell_value(v, card.ability.extra.sell_value)
      end
      return {
        message = localize('k_val_up'),
        colour = G.C.MONEY
      }
    end
  end
}
