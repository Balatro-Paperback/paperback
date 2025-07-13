SMODS.Joker {
  key = 'power_surge',
  config = {
    extra = {
      rank = 7,
      xMult = 2,
      odds = 4,
    }
  },
  rarity = 3,
  pos = { x = 7, y = 10 },
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
        card.ability.extra.rank,
        card.ability.extra.xMult,
        numerator,
        denominator
      }
    }
  end,

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      if context.other_card:get_id() == card.ability.extra.rank then
        if PB_UTIL.chance(card, 'power_surge') then
          local destroyed_card = #G.hand.cards > 0 and
              pseudorandom_element(G.hand.cards, pseudoseed('power_surge_destroy'))

          if destroyed_card then
            destroyed_card.ability.paperback_destroyed = true
          end
        end

        return {
          xmult = card.ability.extra.xMult
        }
      end
    end

    if context.destroy_card and context.cardarea == G.hand and context.destroy_card.ability.paperback_destroyed then
      context.destroy_card.ability.paperback_destroyed = nil

      return {
        remove = true
      }
    end
  end
}
