SMODS.Joker {
  key = "festive_joker",
  config = {
    extra = {
      odds = 5,
      enhancement = 'm_paperback_wrapped'
    }
  },
  rarity = 2,
  pos = { x = 9, y = 10 },
  atlas = "jokers_atlas",
  cost = 6,
  unlocked = true,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,
  paperback = {
    requires_enhancements = true,
  },
  enhancement_gate = 'm_paperback_wrapped',

  loc_vars = function(self, info_queue, card)
    local numerator, denominator = PB_UTIL.chance_vars(card)

    return {
      vars = {
        localize {
          type = 'name_text',
          set = 'Enhanced',
          key = card.ability.extra.enhancement
        },
        numerator,
        denominator
      }
    }
  end,

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      local enhanced = SMODS.has_enhancement(context.other_card, card.ability.extra.enhancement)
      local roll = PB_UTIL.chance(card, 'festive_joker')

      if enhanced and roll then
        local type = PB_UTIL.poll_consumable_type('festive_joker')
        local eff_card = context.blueprint_card or card

        return nil, PB_UTIL.try_spawn_card { set = type.key, func = function()
          SMODS.calculate_effect({
            message = localize('paperback_plus_consumable'),
            colour = G.C.SECONDARY_SET[type.key] or G.C.GREEN,
            juice_card = context.other_card,
            message_card = eff_card
          }, eff_card)
        end }
      end
    end
  end
}
