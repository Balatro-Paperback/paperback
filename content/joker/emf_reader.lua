if PB_UTIL.should_load_spectrum_items() then
  SMODS.Joker {
    key = "emf_reader",
    config = {
      extra = {
        type = 'paperback_Spectrum'
      }
    },
    rarity = 3,
    pos = { x = 25, y = 3 },
    atlas = "jokers_atlas",
    cost = 8,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    paperback_credit = {
      coder = { 'thermo' }
    },
    paperback = {
      requires_custom_suits = true,
      requires_spectrum_or_suit = true
    },

    loc_vars = function(self, info_queue, card)
      return {
        vars = {
          localize(card.ability.extra.type, 'poker_hands'),
          localize('k_spectral')
        }
      }
    end,

    calculate = function(self, card, context)
      if context.first_hand_drawn and not context.blueprint then
        local eval = function() return G.GAME.current_round.hands_played == 0 and not G.RESET_JIGGLES end
        juice_card_until(card, eval, true)
      end
      if context.destroy_card and context.cardarea == G.play then
        if PB_UTIL.contains_spectrum(context.poker_hands) then
          return {
            remove = true
          }
        end
      end
      if context.after then
        if PB_UTIL.contains_spectrum(context.poker_hands) then
          if PB_UTIL.try_spawn_card { set = 'Spectral' } then
            return {
              message = localize('k_plus_spectral'),
              colour = G.C.SPECTRAL,
              card = context.blueprint_card or card,
              message_card = context.blueprint_card or card,
            }
          end
        end
      end
    end
  }
end
