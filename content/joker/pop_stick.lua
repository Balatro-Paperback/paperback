SMODS.Joker {
  key = 'pop_stick',
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
  pos = { x = 1, y = 3 },
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
  -- dummy unlock condition for the unlock all button
  check_for_unlock = function(self, args) return false end,

  locked_loc_vars = function(self, info_queue, card)
    local other_name = localize('k_unknown')
    if G.P_CENTERS['j_paperback_cakepop'].unlocked then
      other_name = localize { type = 'name_text', set = 'Joker', key = 'j_paperback_cakepop' }
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
        card.ability.extra.xMult_if_stick,
        xMult
      }
    }
  end,

  calculate = PB_UTIL.stick_joker_logic,
  joker_display_def = PB_UTIL.stick_joker_display_def
}
