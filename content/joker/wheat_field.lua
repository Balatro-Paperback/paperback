SMODS.Joker {
  key = "wheat_field",
  config = {
    extra = {
      xMult = 1.08,
      xMult_gain = 0.3,
      xMult_base = 1.08,
      suit = "paperback_Crowns",
    }
  },
  attributes = {
    'xmult',
    'suit',
    'crowns'
  },
  rarity = 2,
  pos = { x = 3, y = 10 },
  atlas = "jokers_atlas",
  cost = 6,
  unlocked = true,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,
  paperback = {
    requires_crowns = true,
  },

  paperback_credit = {
    coder = { 'oppositewolf' }
  },

  loc_vars = PB_UTIL.panorama_loc_vars,
  calculate = PB_UTIL.panorama_logic,
  joker_display_def = PB_UTIL.panorama_joker_display_def
}
