SMODS.Joker {
  key = "57_leaf_clover",
  config = {
    extra = {
      gain = 1,
      current = 1,
    },
  },
  attributes = {
    'mod_chance',
    'scaling',
    'reset'
  },
  rarity = 3,
  pos = { x = 24, y = 4 },
  atlas = "jokers_atlas",
  cost = 7,
  unlocked = false,
  discovered = false,
  blueprint_compat = false,
  eternal_compat = true,
  perishable_compat = true,
  soul_pos = nil,
  paperback_credit = {
    coder = { 'vitellary' }
  },

  check_for_unlock = function (self, args)
    return G.GAME.paperback.suits_scored_this_run['Clubs'] and G.GAME.paperback.suits_scored_this_run['Clubs'] >= 57
  end,

  locked_loc_vars = function (self, info_queue, card)
    return {vars = {57, localize('Clubs', 'suits_plural'),}}
  end,

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.current, card.ability.extra.gain } }
  end,

  calculate = function(self, card, context)
    if context.blueprint then return end
    if context.mod_probability then
      return { numerator = context.numerator + card.ability.extra.current }
    end
    if context.end_of_round and context.main_eval then
      if G.GAME.blind.boss then
        SMODS.reset_card(card, {
          ref_table = card.ability.extra,
          ref_value = 'current',
          reset_value = 1
        })
        return nil, true
      else
        SMODS.scale_card(card, {
          ref_table = card.ability.extra,
          ref_value = 'current',
          scalar_value = 'gain',
          message_key = 'paperback_a_odds',
          message_colour = G.C.GREEN
        })
        return nil, true
      end
    end
  end
}
