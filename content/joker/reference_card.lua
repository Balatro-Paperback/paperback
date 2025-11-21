SMODS.Joker {
  key = "reference_card",
  config = {
    extra = {
      x_mult = 1,
      x_mult_mod = 2
    }
  },
  rarity = 2,
  pos = { x = 3, y = 2 },
  atlas = "jokers_atlas",
  cost = 6,
  unlocked = true,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,
  soul_pos = nil,

  loc_vars = function(self, info_queue, card)
    local x_mult = card.ability.extra.x_mult_mod * G.GAME.paperback.reference_card_ct + card.ability.extra.x_mult
    return {
      vars = {
        card.ability.extra.x_mult_mod,
        x_mult
      }
    }
  end,

  calculate = function(self, card, context)
    if context.before then
      PB_UTIL.calculate_highest_shared_played(card)
      if card.ability.extra.message_flag then
        card.ability.extra.message_flag = nil
        SMODS.calculate_effect({
          message = localize('k_upgrade_ex'),
          colour = G.C.MULT,
        }, card)
      end
    end

    -- Gives the xMult during play
    if context.joker_main then
      local x_mult = card.ability.extra.x_mult_mod * G.GAME.paperback.reference_card_ct + card.ability.extra.x_mult

      if x_mult ~= 1 then
        return {
          x_mult = x_mult,
          card = card
        }
      end
    end
  end,

  joker_display_def = function(JokerDisplay)
    return {
      text = {
        {
          border_nodes = {
            { text = "X" },
            { ref_table = "card.joker_display_values", ref_value = "x_mult", retrigger_type = "exp" }
          }
        }
      },
      calc_function = function(card)
        card.joker_display_values.x_mult = card.ability.extra.x_mult_mod * G.GAME.paperback.reference_card_ct +
            card.ability.extra.x_mult
      end,
    }
  end,
}

-- Update global information for Reference Card.
-- See solar_system.lua
function PB_UTIL.calculate_highest_shared_played(card)
  local old = G.GAME.paperback.reference_card_ct
  local hands = G.GAME.hands

  -- Finds the mininum played hand in G.GAME.hands in all base poker hands

  local min_played = hands[PB_UTIL.base_poker_hands[1]].played

  for _, hand in ipairs(PB_UTIL.base_poker_hands) do
    local current_hand = hands[hand]

    if current_hand.played < min_played then
      min_played = current_hand.played
    end
  end

  -- set global to minimum played
  G.GAME.paperback.reference_card_ct = min_played
  if old < G.GAME.paperback.reference_card_ct then
    for _, v in ipairs(SMODS.find_card('j_paperback_reference_card')) do
      v.ability.extra.message_flag = true
    end
  end
end
