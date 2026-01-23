SMODS.Joker {
  key = "yacht_dice",
  config = {
    extra = {
      change = 0.25,
      xm = 1
    }
  },
  rarity = 3,
  pos = { x = 12, y = 7 },
  atlas = "jokers_atlas",
  cost = 8,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = false,
  paperback_credit = {
    coder = { 'thermo' }
  },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.change,
        card.ability.extra.xm
      }
    }
  end,

  add_to_deck =function (self, card, from_debuff)
    local total_hands = PB_UTIL.count_entries(G.GAME.hand_usage)
    card.ability.extra.xm = 1 + total_hands * card.ability.extra.change
  end,

  calculate = function(self, card, context)
    if context.before then
      local total_hands = PB_UTIL.count_entries(G.GAME.hand_usage)
      local upgrade = (total_hands * card.ability.extra.change) + 1 - card.ability.extra.xm
      card.ability.extra.xm = 1 + total_hands * card.ability.extra.change
      if upgrade > 0 then
        return {
          message = localize('k_upgrade_ex'),
          colour = G.C.ORANGE
        }
      end
    end
    if context.joker_main and card.ability.extra.xm ~= 1 then
      return {
        xmult = card.ability.extra.xm
      }
    end
  end
}
