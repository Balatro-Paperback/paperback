SMODS.Joker {
  key = 'subterfuge',
  rarity = 3,
  pos = { x = 3, y = 5 },
  pools = {
    Music = true
  },
  atlas = 'jokers_atlas',
  cost = 8,
  unlocked = true,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,
  soul_pos = nil,

  calculate = function(self, card, context)
    if not context.blueprint and context.destroy_card and (context.cardarea == G.play or context.cardarea == 'unscored') then
      -- Destroy all cards in first hand
      if G.GAME.current_round.hands_played == 0 then
        if context.destroy_card == context.full_hand[#context.full_hand] then
          return {
            remove = true,
            message = localize('paperback_destroyed_ex'),
            colour = G.C.RED
          }
        else
          return {
            remove = true,
          }
        end
      end
    end
  end
}
