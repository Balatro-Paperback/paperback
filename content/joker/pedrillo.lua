SMODS.Joker {
  key = "pedrillo",
  config = {
    extra = {
      rank = 'Queen',
    }
  },

  rarity = 4,
  pos = { x = 12, y = 3 },
  soul_pos = { x = 13, y = 3 },
  atlas = "jokers_atlas",
  cost = 20,
  unlocked = false,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      -- Check if each card is a queen
      if PB_UTIL.is_rank(context.other_card, card.ability.extra.rank) and (#G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit) then
        -- Add the planet corresponding to the played hand type
        G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
        G.E_MANAGER:add_event(Event({
          trigger = 'before',
          delay = 0.0,
          func = function()
            if G.GAME.last_hand_played then
              local _planet = nil
              for k, v in pairs(G.P_CENTER_POOLS.Planet) do
                if v.config.hand_type == G.GAME.last_hand_played then
                  _planet = v.key
                end
              end
              if _planet then
                SMODS.add_card({ key = _planet })
              end
              G.GAME.consumeable_buffer = 0
            end
            return true
          end
        }))
        return { message = localize('k_plus_planet'), colour = G.C.SECONDARY_SET.Planet }
      end
    end
  end,
}
