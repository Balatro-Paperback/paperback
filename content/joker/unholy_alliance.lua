SMODS.Joker {
  key = 'unholy_alliance',
  config = {
    extra = {
      a_chips = 12,
      chips = 0,
      revive_treshold = 666
    }
  },
  attributes = {
    'chips',
    'scaling',
    'prevents_death',
    'secret'
  },
  rarity = 1,
  pos = { x = 6, y = 4 },
  atlas = 'jokers_atlas',
  cost = 6,
  unlocked = false,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = false,
  soul_pos = nil,

  paperback_credit = {
    coder = { 'oppositewolf' }
  },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.a_chips,
        card.ability.extra.chips,
      }
    }
  end,

  check_for_unlock = function(self, args)
    if args.type == 'paperback_sacrificial_lamb_loss' then
      return true
    end
  end,

  locked_loc_vars = function(self, info_queue, card)
    local other_name = localize('k_unknown')
    if G.P_CENTERS['j_paperback_sacrificial_lamb'].unlocked then
      other_name = localize { type = 'name_text', set = 'Joker', key = 'j_paperback_sacrificial_lamb' }
    end
    return {
      vars = {
        other_name, 15
      }
    }
  end,

  calculate = function(self, card, context)
    local count = PB_UTIL.count_destroyed_things(context)
    -- Gains chips when any cards are destroyed, making sure that this joker isn't the one being destroyed
    if not context.blueprint and count > 0 and not (context.joker_type_destroyed and context.card == card) then
      SMODS.scale_card(card, {
        ref_table = card.ability.extra,
        ref_value = 'chips',
        scalar_value = 'a_chips',
        scalar_factor = count,
        scaling_message = {
          message = localize {
            type = 'variable',
            key = 'a_chips',
            vars = { count * card.ability.extra.a_chips }
          },
          colour = G.C.CHIPS
        }
      })

      return nil, true
    end

    -- Gives the chips when scoring
    if context.joker_main and card.ability.extra.chips > 0 then
      return {
        chips = card.ability.extra.chips
      }
    end

    -- Revive ability when chips is 666 or higher
    if not context.blueprint and context.end_of_round and context.game_over then
      if card.ability.extra.chips >= card.ability.extra.revive_treshold then
        PB_UTIL.destroy_joker(card)

        return {
          message = localize('k_saved_ex'),
          saved = 'paperback_saved_unholy_alliance',
          colour = G.C.MULT
        }
      end
    end
  end,

  joker_display_def = function(JokerDisplay)
    return {
      text = {
        { text = "+" },
        { ref_table = "card.ability.extra", ref_value = "chips", retrigger_type = "mult" }
      },
      text_config = { colour = G.C.CHIPS },
    }
  end,
}
