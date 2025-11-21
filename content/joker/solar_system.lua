SMODS.Joker {
  key = "solar_system",
  config = {
    extra = {
      x_mult_mod = 1.5,
      x_mult = 1.5,
    }
  },
  rarity = 2,
  pos = { x = 7, y = 0 },
  atlas = "jokers_atlas",
  cost = 8,
  unlocked = true,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,
  soul_pos = nil,

  loc_vars = function(self, info_queue, card)
    local x_mult = card.ability.extra.x_mult_mod * G.GAME.paperback.solar_system_ct
    return {
      vars = {
        card.ability.extra.x_mult_mod,
        x_mult
      }
    }
  end,

  calculate = function(self, card, context)
    -- If a hand is being leveled up, recalculate the xMult bonus
    if context.paperback and context.paperback.level_up_hand then
      PB_UTIL.update_solar_system(card)
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
      local x_mult = card.ability.extra.x_mult_mod * G.GAME.paperback.solar_system_ct
      return {
        x_mult = x_mult,
        card = card
      }
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
        card.joker_display_values.x_mult = card.ability.extra.x_mult_mod * G.GAME.paperback.solar_system_ct
      end,
    }
  end,
}

-- Update global information for Solar System.
--
-- Implementation notes: If a Solar System is owned, this function is called by its
-- calculate() function, in time for message_flag to work.
-- If no Solar System is owned, we also call this function in
-- mod-global calculate to keep it updated.
-- That means this function is redundantly called in both places, which is awkward
function PB_UTIL.update_solar_system(card)
  local old = G.GAME.paperback.solar_system_ct
  local hands = G.GAME.hands

  -- set the minimum level to the first planet in the subset
  local min_level = hands[PB_UTIL.base_poker_hands[1]].level

  -- go through each hand, comparing them to the first hand in subset
  for _, hand in ipairs(PB_UTIL.base_poker_hands) do
    local current_hand = hands[hand]

    -- if the hand level is lower, set the minimum level to that value
    if to_big(current_hand.level) < to_big(min_level) then
      min_level = current_hand.level
    end
  end

  -- set global to minimum level
  G.GAME.paperback.solar_system_ct = math.max(1, to_number(min_level))
  if old < G.GAME.paperback.solar_system_ct then
    for _, v in ipairs(SMODS.find_card('j_paperback_solar_system')) do
      v.ability.extra.message_flag = true
    end
  end
end
