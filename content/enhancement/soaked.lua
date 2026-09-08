SMODS.Enhancement {
  key = 'soaked',
  atlas = 'enhancements_atlas',
  pos = { x = 0, y = 0 },
  config = {
    extra = {
      odds = 2
    }
  },
  attributes = {
    'chips',
    'destroy_card',
    'chance',
    'discard'
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
      for i, held_card in ipairs(G.hand.cards) do
        if held_card.debuff then
          G.GAME.blind.triggered = true
          G.E_MANAGER:add_event(Event {
            trigger = "immediate",
            func = function()
              SMODS.juice_up_blind(); return true
            end
          })
          card_eval_status_text(held_card, "debuff")
        else
          local soaked_ctx = { paperback = { soaked = true }, cardarea = G.hand }
          -- Works with hooks.lua: SMODS.calculate_card_areas
          -- to score only `held_card`
          -- without Joker-on-card or any secondary effects
          SMODS.score_card(held_card, soaked_ctx)
        end
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