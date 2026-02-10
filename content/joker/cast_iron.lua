SMODS.Joker {
  key = "cast_iron",
  config = {
    extra = {
      divisor = 3,
      hand_size = 0,
      max = 5,
      modifier = 1
    }
  },
  paperback_credit = {
    coder = { 'thermo' }
  },
  rarity = 2,
  pos = { x = 12, y = 11 },
  atlas = "jokers_atlas",
  cost = 7,
  blueprint_compat = false,
  eternal_compat = true,
  perishable_compat = true,

  update_hands = function(self, card)
    if G.playing_cards then
      local steel_tally = 0
      for _, playing_card in ipairs(G.playing_cards) do
        if SMODS.has_enhancement(playing_card, 'm_steel') then steel_tally = steel_tally + 1 end
      end
      local new_handsize = math.min(math.floor(steel_tally / card.ability.extra.divisor) * card.ability.extra.modifier, card.ability.extra.max)
      if new_handsize > card.ability.extra.max then return end
      local change = new_handsize - card.ability.extra.hand_size
      if change ~= 0 then
        card.ability.extra.hand_size = new_handsize
        G.hand:change_size(change)
      end
    end
  end,

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.m_steel
    return {
      vars = {
        card.ability.extra.add_hands,
        card.ability.extra.divisor,
        localize {
          type = 'name_text',
          set = 'Enhanced',
          key = 'm_steel'
        },
        card.ability.extra.hand_size,
        card.ability.extra.max,
        card.ability.extra.modifier
      }
    }
  end,

  add_to_deck = function(self, card, from_debuff)
    self:update_hands(card)
  end,

  remove_from_deck = function(self, card, from_debuff)
    G.hand:change_size(-card.ability.extra.hand_size)
  end,

  calculate = function(self, card, context)
    if context.blueprint then return end
    if context.remove_playing_cards or context.playing_card_added or context.setting_ability then
      self:update_hands(card)
    end
  end,

  in_pool = function(self, args) --equivalent to `enhancement_gate = 'm_steel'`
    for _, playing_card in ipairs(G.playing_cards or {}) do
      if SMODS.has_enhancement(playing_card, 'm_steel') then
        return true
      end
    end
    return false
  end
}
