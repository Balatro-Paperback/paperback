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

      for _, held_card in ipairs(G.hand.cards) do
        local effects = { card = card }

        if has_blood_rain and not SMODS.has_no_rank(held_card) then
          effects.mult = held_card.base.nominal
          effects.colour = G.C.MULT
        else
          effects.chips = held_card:get_chip_bonus()
          effects.colour = G.C.CHIPS
        end

        SMODS.calculate_effect(effects, held_card)
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
