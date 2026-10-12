SMODS.Joker {
  key = 'pointy_stick',
  config = {
    extra = {
      xMult_if_stick = 2
    }
  },
  attributes = {
    'xmult',
    'stick'
  },
  rarity = 1,
  pos = { x = 3, y = 3 },
  atlas = 'jokers_atlas',
  cost = 7,
  unlocked = false,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,
  soul_pos = nil,
  yes_pool_flag = "sticks_can_spawn",

  paperback_credit = {
    coder = { 'oppositewolf' }
  },

  locked_loc_vars = function(self, info_queue, card)
    local other_name = localize('k_unknown')
    if G.P_CENTERS['j_paperback_caramel_apple'].unlocked then
      other_name = localize { type = 'name_text', set = 'Joker', key = 'j_paperback_caramel_apple' }
    end
    return {
      vars = {
        other_name
      }
    }
  end,
  -- dummy unlock condition for the unlock all button
  check_for_unlock = function(self, args) return false end,

  loc_vars = function(self, info_queue, card)
    local xMult = PB_UTIL.calculate_stick_xMult(card)

    return {
      vars = {
        card.ability.extra.xMult_if_stick,
        xMult
      }
    }
  end,

  calculate = PB_UTIL.stick_joker_logic,
  joker_display_def = PB_UTIL.stick_joker_display_def
}
