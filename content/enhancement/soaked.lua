SMODS.Enhancement {
  key = 'soaked',
  atlas = 'enhancements_atlas',
  pos = { x = 0, y = 0 },
  config = {
    extra = {
      odds = 2
    }
  },

  loc_vars = function(self, info_queue, card)
    local numerator, denominator = PB_UTIL.chance_vars(card, self.key)

    return {
      vars = {
        numerator,
        denominator
      }
    }
  end,

  calculate = function(self, card, context)
    if context.cardarea == G.play and context.main_scoring then
      local has_blood_rain = next(SMODS.find_card('j_paperback_blood_rain'))

      -- code partially borrowed from SMODS.score_card
      for i, held_card in ipairs(G.hand.cards) do
        local reps = { 1 }
        local j = 1
        while j <= #reps do
          held_card.repetition_trigger = j > 1 and j - 1
          percent = (i - 0.999) / (#G.hand.cards - 0.998) + (j - 1) * 0.1
          if reps[j] ~= 1 then
            local _, eff = next(reps[j])
            SMODS.calculate_effect(eff, eff.card)
            percent = percent + 0.08
          end

          if held_card.debuff then
            G.GAME.blind.triggered = true
            G.E_MANAGER:add_event(Event {
              trigger = "immediate",
              func = function() SMODS.juice_up_blind(); return true end
            })
            card_eval_status_text(held_card, "debuff")
          else
            local ctx = { paperback = { soaked = true }, cardarea = G.hand }
            local effects = { eval_card(held_card, ctx) }
            ctx.individual = true
            ctx.other_card = held_card
            SMODS.calculate_card_areas("jokers", ctx, effects)
            SMODS.calculate_card_areas("individual", ctx, effects)

            local flags = SMODS.trigger_effects(effects, held_card)

            ctx.individual = nil
            ctx.repetition = true
            ctx.card_effects = effects

            if reps[j] == 1 then
              SMODS.calculate_repetitions(held_card, ctx, reps)
            end
          end
          j = j + ((flags and flags.calculated) and 1 or #reps)
        end
        held_card.repetition_trigger = nil
      end
    end

    if context.discard and context.other_card == card then
      if PB_UTIL.chance(card, 'soaked_destroy') then
        return {
          remove = true,
        }
      end
    end
  end,
}
