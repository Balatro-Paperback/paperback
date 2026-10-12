SMODS.Joker {
  key = "shinzaemon",
  config = {
    extra = {
      card_count = 5,
      a_xmult = 0.2,
      upgrade = "perma_x_mult"
    }
  },
  attributes = {
    'xmult',
    'modify_card',
    'perma_bonus',
  },

  rarity = 4,
  pos = { x = 12, y = 0 },
  soul_pos = { x = 13, y = 0 },
  atlas = "jokers_atlas",
  cost = 20,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,
  unlocked = false,
  paperback_credit = {
    coder = { 'thermo' }
  },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.card_count,
        card.ability.extra.a_xmult
      },
    }
  end,

  calculate = function(self, card, context)
    if context.before and context.main_eval and #context.scoring_hand >= card.ability.extra.card_count then
      local upgrade_card = context.scoring_hand[card.ability.extra.card_count]
      upgrade_card.ability[card.ability.extra.upgrade] = (upgrade_card.ability[card.ability.extra.upgrade] or 1) +
          card.ability.extra.a_xmult
      return {
        message = localize('k_upgrade_ex'),
        colour = G.C.RED,
        message_card = upgrade_card
      }
    end
  end
}
