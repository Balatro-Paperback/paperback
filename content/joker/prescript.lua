SMODS.Joker {
  key = "prescript",
  config = {
    extra = {
      hand = 'High Card',
      active = false,
    },
  },
  rarity = 2,
  pos = { x = 22, y = 10 },
  atlas = "jokers_atlas",
  cost = 6,
  unlocked = true,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,
  soul_pos = nil,

  loc_vars = function(self, info_queue, card)
    local active, colours
    if card.ability.extra.active then
      active = localize('k_active')
      colours = { G.C.FILTER }
    else
      active = localize('paperback_inactive')
      colours = { G.C.UI.TEXT_INACTIVE }
    end
    return {
      vars = {
        card.ability.extra.hand,
        active,
        colours = colours,
      }
    }
  end,

  set_ability = function(self, card, initial, delay_sprites)
    local _poker_hands = {}
    for k, v in pairs(G.GAME.hands) do
      if SMODS.is_poker_hand_visible(k) then _poker_hands[#_poker_hands + 1] = k end
    end
    card.ability.extra.hand = pseudorandom_element(_poker_hands, pseudoseed((card.area and card.area.config.collection) and 'prescript_fake' or 'prescript'))
  end,

  calculate = function(self, card, context)
    if not context.blueprint and context.before and G.GAME.current_round.hands_played == 0 and next(context.poker_hands[card.ability.extra.hand]) then
      card.ability.extra.active = true
      return {
        message = localize('k_active_ex')
      }
    end
    if card.ability.extra.active and context.repetition and context.cardarea == G.play then
      return { repetitions = 1 }
    end
    if not context.blueprint and context.end_of_round and context.main_eval then
      local _poker_hands = {}
      for k, v in pairs(G.GAME.hands) do
        if SMODS.is_poker_hand_visible(k) and k ~= card.ability.extra.hand then _poker_hands[#_poker_hands + 1] = k end
      end
      card.ability.extra.hand = pseudorandom_element(_poker_hands, pseudoseed('prescript'))
      card.ability.extra.active = false
      return {
        message = localize('k_reset')
      }
    end
  end
}
