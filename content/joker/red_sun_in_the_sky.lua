SMODS.Joker {
  key = "red_sun_in_the_sky",
  config = {
    extra = {
      mult = 0,
      change = 1
    }
  },
  attributes = {
    'mult',
    'suit',
    'light',
    'red',
    'scaling',
    'reset'
  },
  rarity = 1,
  pos = { x = 19, y = 5 },
  atlas = "jokers_atlas",
  unlocked = false,
  cost = 5,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,
  paperback = {
    coder = { 'thermo' }
  },

  check_for_unlock = function(self, args)
    if args.type == 'modify_deck' and next(G.playing_cards) then
      for k, v in pairs(G.playing_cards) do
        if not PB_UTIL.is_suit(v, 'light') then return false end
      end
      return true
    end
  end,

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = PB_UTIL.suit_tooltip('light')
    return {
      vars = {
        card.ability.extra.change,
        card.ability.extra.mult
      }
    }
  end,

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      if PB_UTIL.is_suit(context.other_card, 'light') then
        SMODS.scale_card(card, {
          ref_table = card.ability.extra,
          ref_value = 'mult',
          scalar_value = 'change',
          no_message = true
        })
        return {
          mult = card.ability.extra.mult
        }
      end
    end
    if context.end_of_round and context.main_eval then
      SMODS.reset_card(card, {
        ref_table = card.ability.extra,
        ref_value = 'mult',
        reset_value = 0
      })
      return nil, true
    end
  end
}
