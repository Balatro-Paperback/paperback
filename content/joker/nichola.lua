SMODS.Joker {
  key = "nichola",
  rarity = 4,
  pos = { x = 12, y = 4 },
  soul_pos = { x = 13, y = 4 },
  atlas = "jokers_atlas",
  cost = 20,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,
  unlocked = false,

  -- Also see SMODS.calculate_main_scoring hook
  calculate = function(self, card, context)
    if context.paperback and context.paperback.nichola then
      local ctx = {
        cardarea = G.play,
        full_hand = G.play.cards,
        scoring_hand = context.scoring_hand,
        scoring_name = context.scoring_name,
        poker_hands = context.poker_hands
      }

      for _, v in ipairs(G.hand.cards) do
        if v:can_calculate(true) and v:is_face(true) and v.debuff then
          -- Copied from SMODS.calculate_main_scoring
          G.GAME.blind.triggered = true
          G.E_MANAGER:add_event(Event({
              trigger = 'immediate',
              func = (function() SMODS.juice_up_blind();return true end)
          }))
          card_eval_status_text(v, 'debuff')
        elseif v:can_calculate() and v:is_face() then
          SMODS.score_card(v, ctx)
        end
      end
    end
  end
}