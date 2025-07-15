SMODS.Joker {
  key = "stamp",
  config = {
    extra = {
      chips = 0,
      chip_mod = 25,
      odds = 2
    }
  },
  rarity = 3,
  pos = { x = 8, y = 0 },
  atlas = "jokers_atlas",
  cost = 8,
  unlocked = true,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = false,
  pixel_size = { w = 35, h = 45 },

  loc_vars = function(self, info_queue, card)
    local numerator, denominator = PB_UTIL.chance_vars(card)

    return {
      vars = {
        numerator,
        denominator,
        card.ability.extra.chip_mod,
        card.ability.extra.chips
      }
    }
  end,

  calculate = function(self, card, context)
    -- Upgrades Joker if seal is played
    if context.individual and not context.blueprint then
      if context.cardarea == G.play then
        if context.other_card:get_seal() then
          -- Gives chips if roll succeeds
          if PB_UTIL.chance(card, 'stamp') then
            card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chip_mod

            card_eval_status_text(card, 'extra', nil, nil, nil,
              { message = localize('k_upgrade_ex'), colour = G.C.CHIPS })
          end
        end
      end
    end

    -- Gives the chips during play
    if context.joker_main then
      return {
        chips = card.ability.extra.chips,
        card = card
      }
    end
  end
}
