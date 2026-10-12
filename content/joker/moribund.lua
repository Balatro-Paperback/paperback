SMODS.Joker {
  key = 'moribund',
  config = {
    extra = {
      a_mult = 5,
      mult = 0,
      ax_mult = 2,
    }
  },
  attributes = {
    'mult',
    'scaling',
    'red'
  },
  rarity = 2,
  pos = { x = 0, y = 5 },
  atlas = 'jokers_atlas',
  cost = 6,
  unlocked = false,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = false,
  soul_pos = nil,

  paperback_credit = {
    coder = { 'oppositewolf' },
  },

  check_for_unlock = function(self, args)
    return args.type == 'round_win' and G.GAME.current_round.hands_left <= 0 and G.GAME.blind.boss
  end,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.a_mult,
        card.ability.extra.mult,
      }
    }
  end,

  calculate = function(self, card, context)
    -- Prevent Blueprint or Brainstorm from copying these effects
    if not context.blueprint then
      if context.end_of_round and context.main_eval then
        -- If blind not cleared, double current mult
        if to_big(G.GAME.chips - G.GAME.blind.chips) < to_big(0) then
          SMODS.scale_card(card, {
            ref_table = card.ability.extra,
            ref_value = 'mult',
            scalar_value = 'ax_mult',
            operation = 'X',
            message_key = 'paperback_doubled_ex',
            message_colour = G.C.MULT
          })
          return nil, true
        elseif G.GAME.current_round.hands_left == 0 then
          -- If blind cleared and 0 hands left, upgrade joker
          SMODS.scale_card(card, {
            ref_table = card.ability.extra,
            ref_value = 'mult',
            scalar_value = 'a_mult',
            message_colour = G.C.MULT
          })
          return nil, true
        end
      end
    end

    -- Give the mult during scoring
    if context.joker_main then
      if card.ability.extra.mult ~= 0 then
        return {
          mult = card.ability.extra.mult,
        }
      end
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
