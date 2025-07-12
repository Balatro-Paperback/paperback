SMODS.Sound {
  key = 'ITS-TV-TIME',
  path = 'ITS-TV-TIME.ogg',
}

SMODS.Joker {
  key = "its_tv_time",
  rarity = 2,
  pos = { x = 18, y = 7 },
  atlas = "jokers_atlas",
  cost = 7,
  blueprint_compat = false,
  eternal_compat = true,
  perishable_compat = true,
  paperback = {
    requires_custom_suits = true
  },

  in_pool = function()
    if G.playing_cards then
      for _, v in pairs(G.playing_cards) do
        if SMODS.has_enhancement(v, 'm_bonus') or
            (not SMODS.has_no_suit(v) and v.base.suit == 'paperback_Stars') then
          return true
        end
      end
    end
    return false
  end,

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.m_bonus
  end,

  add_to_deck = function(self, card, from_debuff)
    if not from_debuff then
      play_sound("paperback_ITS-TV-TIME")
    end
  end,

  calculate = function(self, card, context)
    if context.check_enhancement and (context.other_card.base.suit == "paperback_Stars"
          or context.other_card.config.center_key == 'm_wild' or context.other_card.config.center.any_suit) then
      return { m_bonus = true }
    end
  end
}
