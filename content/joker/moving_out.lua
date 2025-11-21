SMODS.Joker {
  key = "moving_out",
  config = {
    extra = {
      a_mult = 4,
      mult = 0,
    }
  },
  pools = {
    Music = true
  },
  rarity = 1,
  pos = { x = 20, y = 10 },
  atlas = "jokers_atlas",
  cost = 4,
  unlocked = true,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = false,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.a_mult,
        card.ability.extra.mult,
      }
    }
  end,

  calculate = function(self, card, context)
    if context.end_of_round and context.main_eval then
      local other_played_count = 0 -- calculate highest played count for other hands
      for k, v in pairs(G.GAME.hands) do
        if v.visible and k ~= G.GAME.last_hand_played then
          if v.played > other_played_count then
            other_played_count = v.played
          end
        end
      end

      if G.GAME.hands[G.GAME.last_hand_played].played > other_played_count then
        -- If last hand played has a greater count than all others, it is most played. Exit
        -- (Must be strictly bigger: this play incremented the count already)
        return
      end

      card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.a_mult
      return {
        message = localize('k_upgrade_ex'),
        card = card,
        colour = G.C.MULT,
      }
    end

    if context.joker_main then
      return {
        mult = card.ability.extra.mult
      }
    end
  end,

  joker_display_def = function(JokerDisplay)
    return {
      text = {
        { text = "+" },
        { ref_table = "card.ability.extra", ref_value = "mult", retrigger_type = "mult" }
      },
      text_config = { colour = G.C.MULT },
    }
  end,
}
