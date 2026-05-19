SMODS.Joker {
  key = "blood_rain",
  attributes = {
    'mult',
    'enhancements',
    'red'
  },
  rarity = 3,
  pos = { x = 17, y = 6 },
  atlas = "jokers_atlas",
  cost = 8,
  blueprint_compat = false,
  eternal_compat = true,
  perishable_compat = true,
  enhancement_gate = 'm_paperback_soaked',
  paperback = {
    requires_enhancements = true
  },
  paperback_credit = {
    coder = { 'srockw' }
  },

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.m_paperback_soaked

    return {
      vars = {
        localize {
          type = 'name_text',
          set = "Enhanced",
          key = 'm_paperback_soaked'
        }
      }
    }
  end
}
