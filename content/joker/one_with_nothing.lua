SMODS.Joker {
  key = "one_with_nothing",
  config = {
    extra = {

    }
  },
  attributes = {
    "discard"
  },
  rarity = 2,
  unlocked = false,
  pos = { x = 11, y = 13 },
  atlas = "jokers_atlas",
  cost = 5,
  blueprint_compat = false,
  eternal_compat = true,
  perishable_compat = true,
  paperback = {

  },
  paperback_credit = {
    coder = { 'dowfrin' }
  },

  check_for_unlock = function(self, args)
    return G.GAME.round >= 1 and G.playing_cards and #G.playing_cards <= 0
  end,

  calculate = function(self, card, context)
    if context.press_play then
      G.E_MANAGER:add_event(Event({
        func = function()
          local lol_imagine_if_i_forgot_to_set_this_back = G.hand.config.highlighted_limit
          G.hand.config.highlighted_limit = 1e10
          for k, v in pairs(G.hand.cards) do
            G.hand:add_to_highlighted(v)
            delay(0.1)
          end
          G.FUNCS.discard_cards_from_highlighted(nil, true)
          G.hand.config.highlighted_limit = lol_imagine_if_i_forgot_to_set_this_back
          return true
        end
      }))
    end
  end
}
