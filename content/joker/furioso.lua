SMODS.Joker {
  key = "furioso",
  config = {
    extra = {
      x_mult_mod = 0.2,
      x_mult = 1,
      ranks = {},
    }
  },
  rarity = 2,
  pos = { x = 2, y = 0 },
  atlas = "jokers_atlas",
  cost = 6,
  unlocked = false,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,
  soul_pos = nil,

  check_for_unlock = function(self, args)
    return args.type == 'round_win' and G.GAME.current_round.hands_played == 1 and
        G.GAME.blind.boss and G.GAME.blind.name == 'Cerulean Bell'
  end,
  loc_vars = function(self, info_queue, card)
    local ranks_played = ""

    if not card.ability.extra.ranks_sorted then
      card.ability.extra.ranks_sorted = {}
      for _, v in pairs(card.ability.extra.ranks) do
        table.insert(card.ability.extra.ranks_sorted, v)
      end

      table.sort(
        card.ability.extra.ranks_sorted,
        function(a, b)
          return SMODS.Ranks[a].sort_nominal < SMODS.Ranks[b].sort_nominal
        end
      )
    end
    for k, v in ipairs(card.ability.extra.ranks_sorted) do
      ranks_played = ranks_played .. " " .. localize(v, 'ranks')
    end

    if ranks_played == "" then
      ranks_played = " " .. localize('paperback_none')
    end

    return {
      vars = {
        card.ability.extra.x_mult_mod,
        card.ability.extra.x_mult,
        ranks_played
      }
    }
  end,

  calculate = function(self, card, context)
    -- Calculate the added x_mult depending on rank flags
    if context.individual and not context.blueprint and not context.repetition then
      if context.cardarea == G.play and not context.other_card.debuff then
        local rank = not SMODS.has_no_rank(context.other_card) and context.other_card:get_id()

        if rank and not card.ability.extra.ranks[rank] then
          card.ability.extra.x_mult = card.ability.extra.x_mult + card.ability.extra.x_mult_mod
          card.ability.extra.ranks[rank] = context.other_card.base.value
          -- recalc ranks_sorted
          card.ability.extra.ranks_sorted = nil

          return {
            extra = { focus = card, message = localize('k_upgrade_ex'), colour = G.C.MULT },
            card = card,
          }
        end
      end
    end

    -- Give the x_mult during play
    if context.joker_main then
      return {
        x_mult = card.ability.extra.x_mult,
        card = card
      }
    end

    -- If boss blind defeated, reset all rank flags and reset x_mult
    if context.end_of_round and context.main_eval and G.GAME.blind.boss and not context.blueprint then
      card.ability.extra.ranks = {}
      card.ability.extra.ranks_sorted = {}
      card.ability.extra.x_mult = 1

      return {
        message = localize('k_reset'),
        colour = G.C.RED
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
        local new_ranks = {}
        local new_ranks_count = 0
        local _, _, scoring_hand = JokerDisplay.evaluate_hand()
        for _, scoring_card in ipairs(scoring_hand) do
          if not scoring_card.debuff then
            local rank = not SMODS.has_no_rank(scoring_card) and scoring_card:get_id()
            if rank and not card.ability.extra.ranks[rank] and not new_ranks[rank] then
              new_ranks[rank] = true
              new_ranks_count = new_ranks_count + 1
            end
          end
        end
        card.joker_display_values.x_mult = card.ability.extra.x_mult + card.ability.extra.x_mult_mod * new_ranks_count
      end,
    }
  end,
}
