SMODS.Joker {
  key = "paralyzed",
  rarity = 2,
  pos = { x = 20, y = 0 },
  atlas = "jokers_atlas",
  cost = 7,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,
  paperback_credit = {
    coder = { 'thermo' }
  },
  loc_vars = function (self, info_queue, card)
    return { vars = {localize('k_tarot')}}
  end,
  calculate = function(self, card, context)
    if context.end_of_round and context.main_eval then
      if PB_UTIL.try_spawn_card { set = 'Tarot' } then
        return {
          message = localize('k_plus_tarot'),
          colour = G.C.TAROT,
          card = context.blueprint_card or card,
          message_card = context.blueprint_card or card
        }
      end
    end
  end
}