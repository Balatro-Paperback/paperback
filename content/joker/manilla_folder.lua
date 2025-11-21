SMODS.Joker {
  key = "manilla_folder",
  config = {
    extra = {
      money = 2
    }
  },
  rarity = 1,
  pos = { x = 10, y = 8 },
  atlas = "jokers_atlas",
  cost = 4,
  unlocked = true,
  discovered = false,
  blueprint_compat = false,
  eternal_compat = true,
  perishable_compat = true,
  paperback = {
    requires_paperclips = true
  },

  in_pool = function(self, args)
    for _, v in ipairs(G.playing_cards or {}) do
      if PB_UTIL.has_paperclip(v) then return true end
    end
  end,

  loc_vars = function(self, info_queue, card)
    local unique_clips = {}
    local amount = 0

    for _, v in ipairs(G.playing_cards or {}) do
      local key = PB_UTIL.has_paperclip(v)
      if key and not unique_clips[key] then
        unique_clips[key] = true
        amount = amount + 1
      end
    end

    return {
      vars = {
        card.ability.extra.money,
        card.ability.extra.money * amount
      }
    }
  end,

  calc_dollar_bonus = function(self, card)
    local unique_clips = {}
    local amount = 0

    for _, v in ipairs(G.playing_cards or {}) do
      local key = PB_UTIL.has_paperclip(v)
      if key and not unique_clips[key] then
        unique_clips[key] = true
        amount = amount + 1
      end
    end

    if amount > 0 then
      return amount * card.ability.extra.money
    end
  end,

  joker_display_def = function(JokerDisplay)
    return {
      text = {
        { text = "+$" },
        { ref_table = "card.joker_display_values", ref_value = "dollars" },
      },
      text_config = { colour = G.C.GOLD },
      reminder_text = {
        { ref_table = "card.joker_display_values", ref_value = "localized_text" },
      },
      calc_function = function(card)
        local unique_clips = {}
        local amount = 0

        for _, v in ipairs(G.playing_cards or {}) do
          local key = PB_UTIL.has_paperclip(v)
          if key and not unique_clips[key] then
            unique_clips[key] = true
            amount = amount + 1
          end
        end
        card.joker_display_values.dollars = card.ability.extra.money * amount
        card.joker_display_values.localized_text = "(" .. localize("k_round") .. ")"
      end
    }
  end,
}
