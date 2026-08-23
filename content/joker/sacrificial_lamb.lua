SMODS.Joker {
  key = 'sacrificial_lamb',
  config = {
    extra = {
      mult_mod = 3,
      mult = 0
    }
  },
  attributes = {
    'mult',
    'scaling',
    'red'
  },
  rarity = 1,
  pos = { x = 5, y = 0 },
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
        card.ability.extra.mult_mod,
        card.ability.extra.mult,
      }
    }
  end,

  check_for_unlock = function(self, args)
    if args.type == 'paperback_removed_playing_cards' then
      return G.GAME.paperback.destroyed_cards["cards"] >= 20
    end
  end,

  locked_loc_vars = function(self, info_queue, card)
    return {
      vars = { 20 }
    }
  end,

  calculate = function(self, card, context)
    local count = PB_UTIL.count_destroyed_things(context)
    -- Gains mult when any cards are destroyed, making sure that this joker isn't the one being destroyed
    if not context.blueprint and count > 0 and not (context.joker_type_destroyed and context.card == card) then
      SMODS.scale_card(card, {
        ref_table = card.ability.extra,
        ref_value = 'mult',
        scalar_value = 'mult_mod',
        operation = function(ref_table, ref_value, initial, scaling)
          ref_table[ref_value] = initial + scaling * count
        end,
        scaling_message = {
          message = localize {
            type = 'variable',
            key = 'a_mult',
            vars = { count * card.ability.extra.mult_mod }
          },
          colour = G.C.MULT
        }
      })
      return nil, true
    end

    -- Gives the mult when scoring
    if context.joker_main and card.ability.extra.mult > 0 then
      return {
        mult = card.ability.extra.mult
      }
    end

    -- Unlocking Unholy Alliance
    if context.end_of_round and context.game_over and context.main_eval and card.ability.extra.mult >= 15 then
      check_for_unlock({ type = 'paperback_sacrificial_lamb_loss' })
    end
  end,

  joker_display_def = function(JokerDisplay)
    return {
      text = {
        { text = "+" },
        { ref_table = "card.ability.extra", ref_value = "mult", retrigger_type = "mult" }
      },
      text_config = { colour = G.C.MULT },
    }
  end,
}
