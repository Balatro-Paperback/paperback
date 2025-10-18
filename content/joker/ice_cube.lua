SMODS.Joker {
  key = "ice_cube",
  config = {
    extra = {
      hands = 1,
    }
  },
  rarity = 1,
  pos = { x = 3, y = 8 },
  atlas = 'jokers_atlas',
  cost = 4,
  unlocked = false,
  blueprint_compat = true,
  eternal_compat = false,
  pools = {
    Food = true
  },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.hands,
      }
    }
  end,

  calculate = function(self, card, context)
    if context.setting_blind then
      ease_hands_played(card.ability.extra.hands)
      return {
        message = localize {
          type = 'variable',
          key = 'a_hands',
          vars = { card.ability.extra.hands }
        },
        colour = G.C.BLUE
      }
    end

    if context.after and SMODS.last_hand_oneshot and not context.blueprint then
      PB_UTIL.destroy_joker(card)
      return {
        message = localize('paperback_melted_ex'),
        colour = G.C.BLUE
      }
    end
  end,

  check_for_unlock = function(self, args)
    if args.type == 'modify_jokers' and #PB_UTIL.get_owned_food() >= 5 then
      return true
    end
  end,

  locked_loc_vars = function(self, info_queue, card)
    return {
      vars = { 5 }
    }
  end
}
