SMODS.Joker {
  key = 'derecho',
  config = {
    extra = {
      x_mult_mod = 0.1,
      x_mult = 1
    }
  },
  attributes = {
    'xmult',
    'scaling',
    'suit',
    'dark'
  },
  rarity = 2,
  pos = { x = 0, y = 1 },
  atlas = 'jokers_atlas',
  cost = 6,
  unlocked = false,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = false,
  paperback_credit = {
    coder = { 'oppositewolf' },
  },

  locked_loc_vars = function (self, info_queue, card)
    return {vars = {10, localize("Spades", 'suits_singular'), localize("Clubs", 'suits_singular')},}
  end,

  check_for_unlock = function (self, args)
    if args.type == 'paperback_suit_flushes' then
      if ((G.GAME.paperback.played_flushes['Spades'] or 0) + (G.GAME.paperback.played_flushes['Clubs'] or 0)) >= 10 then
        return true
      end
    end
  end,

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = PB_UTIL.suit_tooltip('dark')

    return {
      vars = {
        card.ability.extra.x_mult_mod,
        card.ability.extra.x_mult
      }
    }
  end,

  calculate = function(self, card, context)
    -- Upgrade the Joker when hand is played
    if context.before and context.main_eval and not context.blueprint then
      local bad_suit = false
      for _, v in ipairs(context.scoring_hand) do
        bad_suit = bad_suit or PB_UTIL.is_non_suit(v, 'dark', true)
      end
      if not bad_suit then
        SMODS.scale_card(card, {
          ref_table = card.ability.extra,
          ref_value = 'x_mult',
          scalar_value = 'x_mult_mod',
          message_colour = G.C.MULT
        })
        return nil, true
      end
    end

    -- Give the xMult during play
    if context.joker_main and card.ability.extra.x_mult ~= 1 then
      return {
        x_mult = card.ability.extra.x_mult,
        card = card,
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
