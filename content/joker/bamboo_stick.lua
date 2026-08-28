SMODS.Joker {
  key = 'bamboo_stick',
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
  pos = { x = 25, y = 12 },
  atlas = 'jokers_atlas',
  cost = 7,
  unlocked = true,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,
  soul_pos = nil,
  yes_pool_flag = "sticks_can_spawn",

  paperback_credit = {
    coder = { 'oppositewolf' }
  },

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