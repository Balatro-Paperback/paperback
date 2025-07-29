SMODS.Joker {
  key = "let_it_happen",
  config = {
    extra = {
      hands_played_this_ante = {},
    }
  },
  pools = {
    Music = true
  },
  rarity = 3,
  pos = { x = 7, y = 2 },
  atlas = "jokers_atlas",
  cost = 8,
  unlocked = true,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,
  soul_pos = nil,

  loc_vars = function(self, info_queue, card)
    local hands_played_string = ""

    for i = 1, #card.ability.extra.hands_played_this_ante do
      if i == 1 then
        hands_played_string = hands_played_string .. " "
      else
        hands_played_string = hands_played_string .. ", "
      end

      hands_played_string = hands_played_string .. localize(card.ability.extra.hands_played_this_ante[i], "poker_hands")
    end

    if hands_played_string == "" then
      hands_played_string = " " .. localize('paperback_none')
    end

    return {
      vars = {
        hands_played_string
      }
    }
  end,

  calculate = function(self, card, context)
    if context.joker_main then
      -- Return early if hand has already been played this ante
      for i = 1, #card.ability.extra.hands_played_this_ante do
        if context.scoring_name == card.ability.extra.hands_played_this_ante[i] then
          return
        end
      end

      -- Balance the chips if the hand is not debuffed
      if not context.debuffed_hand then
        return {
          func = function()
            PB_UTIL.apply_plasma_effect(context.blueprint_card or card)
            table.insert(card.ability.extra.hands_played_this_ante, context.scoring_name)
          end
        }
      end
    end

    -- Reset the joker at the end of the ante
    ---@diagnostic disable-next-line: undefined-field
    if context.end_of_round and context.main_eval and G.GAME.blind.boss and not context.blueprint then
      card.ability.extra.hands_played_this_ante = {}

      return {
        message = localize('k_reset'),
        colour = { 0.8, 0.45, 0.85, 1 }
      }
    end
  end
}
