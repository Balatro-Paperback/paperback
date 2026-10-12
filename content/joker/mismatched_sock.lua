SMODS.Joker {
  key = 'mismatched_sock',
  config = {
    extra = {
      x_mult = 1,
      a_xmult = 0.1,
    }
  },
  attributes = {
    'xmult',
    'scaling',
    'discard',
    'hand_type',
    'reset'
  },
  rarity = 2,
  pos = { x = 6, y = 1 },
  atlas = 'jokers_atlas',
  cost = 6,
  unlocked = false,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = false,

  paperback_credit = {
    coder = { 'srockw' },
  },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.a_xmult,
        card.ability.extra.x_mult
      }
    }
  end,

  locked_loc_vars = function(self, info_queue, card)
    return { vars = { localize('Pair', 'poker_hands') } }
  end,
  check_for_unlock = function(self, args)
    if args.type == 'win_no_hand' then
      if not G.GAME.paperback.played_pair_this_run then
        return true
      end
    end
  end,

  calculate = function(self, card, context)
    -- Upgrade x mult if discard contains only one card
    if not context.blueprint and context.discard then
      if #context.full_hand == 1 then
        SMODS.scale_card(card, {
          ref_table = card.ability.extra,
          ref_value = 'x_mult',
          scalar_value = 'a_xmult'
        })
        return nil, true
      end
    end

    if context.before and not context.blueprint then
      if next(context.poker_hands['Pair']) then
        SMODS.reset_card(card, {
          ref_table = card.ability.extra,
          ref_value = 'x_mult',
          reset_value = 1
        })
        return nil, true
      end
    end

    -- Give mult during scoring
    if context.joker_main then
      return {
        x_mult = card.ability.extra.x_mult
      }
    end
  end,

  joker_display_def = function(JokerDisplay)
    return {
      text = {
        {
          border_nodes = {
            { text = "X" },
            { ref_table = "card.ability.extra", ref_value = "x_mult", retrigger_type = "exp" }
          }
        }
      },
    }
  end,
}
