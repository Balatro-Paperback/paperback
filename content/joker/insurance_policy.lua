SMODS.Joker {
  key = 'insurance_policy',
  config = {
    extra = {
      a_mult = 8,
    }
  },
  rarity = 2,
  pos = { x = 19, y = 7 },
  atlas = "jokers_atlas",
  cost = 6,
  unlocked = true,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,


  loc_vars = function(self, info_queue, card)
    -- a reference to nothing in particular
    local worker_tally = 0
    if G.playing_cards then
      for k, v in pairs(G.playing_cards) do
        -- Checks both in case a card counts as both a King and a Jack
        if PB_UTIL.is_rank(v, 11) then worker_tally = worker_tally + 1 end
        if PB_UTIL.is_rank(v, 13) then worker_tally = worker_tally - 1 end
      end
    end
    return {
      vars = {
        card.ability.extra.a_mult,
        PB_UTIL.force_signed(card.ability.extra.a_mult * worker_tally)
      }
    }
  end,

  calculate = function(self, card, context)
    if context.joker_main then
      local worker_tally = 0
      for k, v in pairs(G.playing_cards) do
        -- Checks both in case a card counts as both a King and a Jack
        if PB_UTIL.is_rank(v, 11) then worker_tally = worker_tally + 1 end
        if PB_UTIL.is_rank(v, 13) then worker_tally = worker_tally - 1 end
      end

      return {
        mult = card.ability.extra.a_mult * worker_tally,
        card = card
      }
    end
  end,

  joker_display_def = function(JokerDisplay)
    return {
      text = {
        { ref_table = "card.joker_display_values", ref_value = "mult", retrigger_type = "mult" }
      },
      text_config = { colour = G.C.MULT },
      calc_function = function(card)
        local worker_tally = 0
        if G.playing_cards then
          for k, v in pairs(G.playing_cards) do
            -- Checks both in case a card counts as both a King and a Jack
            if PB_UTIL.is_rank(v, 11) then worker_tally = worker_tally + 1 end
            if PB_UTIL.is_rank(v, 13) then worker_tally = worker_tally - 1 end
          end
        end
        card.joker_display_values.mult = PB_UTIL.force_signed(card.ability.extra.a_mult * worker_tally)
      end
    }
  end,
}
