SMODS.Joker {
  key = 'paranoia',
  config = {
    extra = {
      a_mult = 2
    }
  },
  rarity = 3,
  pos = { x = 6, y = 3 },
  atlas = 'jokers_atlas',
  cost = 8,
  unlocked = true,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = false,

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = PB_UTIL.suit_tooltip('light')
    info_queue[#info_queue + 1] = PB_UTIL.suit_tooltip('dark')

    return {
      vars = {
        card.ability.extra.a_mult,
        G.GAME.paperback.destroyed_dark_suits * card.ability.extra.a_mult
      }
    }
  end,

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      if PB_UTIL.is_suit(context.other_card, 'light') then
        return {
          mult = G.GAME.paperback.destroyed_dark_suits * card.ability.extra.a_mult
        }
      end
    end
  end
}

local calc_context_ref = SMODS.calculate_context
function SMODS.calculate_context(context, return_table)
  if context.remove_playing_cards then
    for _, v in ipairs(context.removed or {}) do
      if PB_UTIL.is_suit(v, 'dark', false, true) then
        G.GAME.paperback.destroyed_dark_suits = G.GAME.paperback.destroyed_dark_suits + 1
      end
    end
  end

  return calc_context_ref(context, return_table)
end
