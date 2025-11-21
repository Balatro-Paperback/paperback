SMODS.Joker {
  key = "collector",
  config = {
    extra = {
      money = 1
    }
  },
  rarity = 2,
  pos = { x = 21, y = 3 },
  atlas = "jokers_atlas",
  cost = 7,
  unlocked = true,
  discovered = false,
  blueprint_compat = false,
  eternal_compat = true,
  perishable_compat = true,
  paperback = {
    requires_enhancements = true
  },
  enhancement_gate = 'm_paperback_sleeved',

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.m_paperback_sleeved

    local sleeves = 0

    for _, v in ipairs(G.playing_cards or {}) do
      if SMODS.has_enhancement(v, 'm_paperback_sleeved') then
        sleeves = sleeves + 1
      end
    end

    return {
      vars = {
        card.ability.extra.money,
        localize {
          type = 'name_text',
          set = 'Enhanced',
          key = 'm_paperback_sleeved'
        },
        card.ability.extra.money * sleeves
      }
    }
  end,

  calc_dollar_bonus = function(self, card)
    local sleeves = 0

    for _, v in ipairs(G.playing_cards) do
      if SMODS.has_enhancement(v, 'm_paperback_sleeved') then
        sleeves = sleeves + 1
      end
    end


    if sleeves > 0 then
      return sleeves * card.ability.extra.money
    end
  end
}
