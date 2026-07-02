SMODS.Joker {
  key = "shugi_bukuro",
  config = {
    extra = {
      dollars = 2,
      a_dollars = 2
    }
  },
  rarity = 1,
  pos = { x = 0, y = 12 },
  atlas = "jokers_atlas",
  cost = 6,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = false,
  paperback_credit = {
    coder = { 'ThermoDyn' }
  },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.dollars,
        card.ability.extra.a_dollars
      }
    }
  end,

  calculate = function(self, card, context)
    if context.skip_blind then
      SMODS.scale_card(card, {
        ref_table = card.ability.extra,
        ref_value = 'dollars',
        scalar_value = 'a_dollars',
        scaling_message = {
          message = localize('k_upgrade_ex'),
          colour = G.C.ORANGE
        }
      })
      return {
        dollars = card.ability.extra.dollars
      }
    end
  end
}