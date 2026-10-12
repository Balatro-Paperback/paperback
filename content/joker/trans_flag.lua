SMODS.Joker {
  key = 'trans_flag',
  config = {
    extra = {
      a_mult = 5,
    }
  },
  attributes = {
    'mult',
    'discard'
  },
  rarity = 1,
  pos = { x = 22, y = 0 },
  atlas = 'jokers_atlas',
  cost = 6,
  unlocked = false,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,

  paperback_credit = {
    coder = { 'dowfrin' }
  },

  locked_loc_vars = function(self, info_queue, card)
    local other_name = localize('k_unknown')
    if G.P_CENTERS['j_paperback_jestrogen'].unlocked then
      other_name = localize { type = 'name_text', set = 'Joker', key = 'j_paperback_jestrogen' }
    end
    local other_other_name = localize('k_unknown')
    if G.P_CENTERS['j_paperback_jestosterone'].unlocked then
      other_other_name = localize { type = 'name_text', set = 'Joker', key = 'j_paperback_jestosterone' }
    end
    return {
      vars = {
        other_name, other_other_name
      }
    }
  end,

  check_for_unlock = function(self, args)
    if args.type == 'modify_jokers' and G.jokers then
      for _, v in ipairs(G.jokers.cards) do
        if v.config.center_key == 'j_paperback_jestrogen' then return true end
        if v.config.center_key == 'j_paperback_jestosterone' then return true end
      end
    end
  end,

  loc_vars = function(self, info_queue, card)
    local discards = 0
    if G.GAME then discards = G.GAME.current_round.discards_left end
    return {
      vars = {
        card.ability.extra.a_mult,
        discards * card.ability.extra.a_mult }
    }
  end,
  calculate = function(self, card, context)
    if context.joker_main then
      return {
        mult = G.GAME.current_round.discards_left * card.ability.extra.a_mult
      }
    end
  end,

  joker_display_def = function(JokerDisplay)
    return {
      text = {
        { text = "+" },
        { ref_table = "card.joker_display_values", ref_value = "mult", retrigger_type = "mult" }
      },
      text_config = { colour = G.C.MULT },
      calc_function = function(card)
        card.joker_display_values.mult = G.GAME.current_round.discards_left * card.ability.extra.a_mult
      end
    }
  end,
}
