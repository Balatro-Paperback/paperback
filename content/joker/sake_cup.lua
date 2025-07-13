SMODS.Joker {
  key = 'sake_cup',
  config = {
    extra = {
      odds = 2,
      rank = "9",
    }
  },
  rarity = 3,
  pos = { x = 6, y = 9 },
  atlas = 'jokers_atlas',
  cost = 8,
  unlocked = true,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,

  loc_vars = function(self, info_queue, card)
    local numerator, denominator = PB_UTIL.chance_vars(card)

    return {
      vars = {
        localize(card.ability.extra.rank, 'ranks'),
        numerator,
        denominator
      }
    }
  end,

  -- Calculate function for the Joker
  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.hand and PB_UTIL.is_rank(context.other_card, card.ability.extra.rank) then
      if not context.other_card.debuff and PB_UTIL.chance(card, 'sake_cup') then
        local planet = PB_UTIL.get_planet_for_hand(context.scoring_name)
        local eff_card = context.blueprint_card or card

        if planet and PB_UTIL.can_spawn_card(G.consumeables, true) then
          return {
            message = localize('k_plus_planet'),
            colour = G.C.SECONDARY_SET.Planet,
            message_card = eff_card,
            juice_card = context.other_card,
            func = function()
              G.E_MANAGER:add_event(Event {
                func = function()
                  SMODS.add_card { key = planet }
                  G.GAME.consumeable_buffer = 0
                  return true
                end
              })
            end
          }
        end
      end
    end
  end
}
