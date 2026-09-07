SMODS.Joker {
  key = 'rockin_stick',
  config = {
    extra = {
      xMult = 1.5
    }
  },
  attributes = {
    'xmult',
    'stick'
  },
  rarity = 1,
  pos = { x = 8, y = 8 },
  atlas = 'jokers_atlas',
  cost = 7,
  unlocked = false,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,
  yes_pool_flag = "sticks_can_spawn",
  paperback = {
    requires_stars = true
  },

  paperback_credit = {
    coder = { 'srockw' }
  },
  -- dummy unlock condition for the unlock all button
  check_for_unlock = function(self, args) return false end,

  locked_loc_vars = function(self, info_queue, card)
    local other_name = localize('k_unknown')
    if G.P_CENTERS['j_paperback_rock_candy'].unlocked then
      other_name = localize { type = 'name_text', set = 'Joker', key = 'j_paperback_rock_candy' }
    end
    return {
      vars = {
        other_name
      }
    }
  end,

  loc_vars = function(self, info_queue, card)
    local xMult = PB_UTIL.calculate_stick_xMult(card)

    return {
      vars = {
        card.ability.extra.xMult,
        xMult
      }
    }
  end,

  calculate = PB_UTIL.stick_joker_logic,
  joker_display_def = PB_UTIL.stick_joker_display_def
}
