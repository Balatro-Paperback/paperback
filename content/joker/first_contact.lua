SMODS.Joker {
  key = "first_contact",
  config = {
    extra = {
      required = 17,
    }
  },

  paperback_credit = {
    coder = { 'thermo' }
  },

  rarity = 3,
  pos = { x = 22, y = 9 },
  atlas = "jokers_atlas",
  cost = 8,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = PB_UTIL.suit_tooltip('dark')
    return {
      vars = {
        card.ability.extra.required,
        card.ability.extra.required - (G.GAME.paperback.first_contact_count % card.ability.extra.required),
        localize('k_spectral')
      }
    }
  end,

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play and PB_UTIL.is_suit(context.other_card, 'dark') then
      if G.GAME.paperback.first_contact_count % card.ability.extra.required <= 0 then
        if PB_UTIL.try_spawn_card { set = 'Spectral' } then
          return {
            message = localize('k_plus_spectral'),
            colour = G.C.SPECTRAL,
            card = context.blueprint_card or card,
            message_card = context.blueprint_card or card
          }
        end
      end
    end
  end
}
