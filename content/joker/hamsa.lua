SMODS.Joker {
  key = "hamsa",
  config = {
    extra = {
      select = 2,
    },
  },
  attributes = {
    'hands',
    'retrigger'
  },
  rarity = 1,
  pos = { x = 22, y = 5 },
  atlas = "jokers_atlas",
  cost = 5,
  unlocked = false,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,
  soul_pos = nil,

  paperback_credit = {
    coder = { 'vitellary' },
  },

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.select } }
  end,

  unlock_condition = { type = 'c_losses', extra = 1 },

  in_pool = function(self, args) return SMODS.showman("hamsa") or not next(SMODS.find_card("j_paperback_hamsa_r", true)) end,

  calculate = function(self, card, context)
    if G.GAME.current_round.hands_played == 0 and context.repetition and context.cardarea == G.play then
      for i = 1, card.ability.extra.select do
        if context.other_card == context.scoring_hand[i] then
          return {
            repetitions = 1,
          }
        end
      end
    end
    if not context.blueprint and context.end_of_round and context.main_eval then
      PB_UTIL.use_consumable_animation(nil, card, function()
        card:set_ability(G.P_CENTERS['j_paperback_hamsa_r'])
        unlock_card(card)
      end)
      return {
        message = localize('paperback_hamsa_reverse'),
        colour = G.C.FILTER
      }
    end
  end
}
