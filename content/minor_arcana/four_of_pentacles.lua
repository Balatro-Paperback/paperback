PB_UTIL.MinorArcana {
  key = 'four_of_pentacles',
  atlas = 'minor_arcana_atlas',
  pos = { x = 3, y = 6 },
  config = {
    min_highlighted = 4,
    max_highlighted = 4,
    extra = {
      numerator = 1,
      denominator = 2
    }
  },

  loc_vars = function(self, info_queue, card)
    local num, dem = SMODS.get_probability_vars(
      card,
      card.ability.extra.numerator,
      card.ability.extra.denominator,
      "paperback_four_of_pentacles"
    )
    return { vars = {
      card.ability.max_highlighted,
      num,
      dem
    } }
  end,

  use = function(self, card, area)
    local cards = {}

    for _, v in ipairs(G.hand.cards) do
      if (not v.highlighted)
          and SMODS.pseudorandom_probability(
            card,
            "four_of_pentacles",
            card.ability.extra.numerator,
            card.ability.extra.denominator,
            "paperback_four_of_pentacles")
          then
        cards[#cards + 1] = v
      end
    end

    PB_UTIL.use_consumable_animation(card, nil, function()
      if #cards > 0 then
        SMODS.destroy_cards(cards)
      end
    end)
  end
}
