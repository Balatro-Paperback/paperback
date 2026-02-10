SMODS.Joker {
  key = "trust_us",
  config = {
    extra = {
      active_xmult = 3,
      inactive_xmult = 0.5,
    },
  },
  rarity = 2,
  pos = { x = 24, y = 5 },
  atlas = "jokers_atlas",
  cost = 6,
  unlocked = true,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,
  soul_pos = nil,
  pools = {
    Music = true
  },

  paperback_credit = {
    coder = { 'vitellary' }
  },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.active_xmult,
        card.ability.extra.inactive_xmult,
        localize("Three of a Kind", 'poker_hands')
      }
    }
  end,

  calculate = function(self, card, context)
    if context.joker_main then
      if next(context.poker_hands["Three of a Kind"]) then
        return { xmult = card.ability.extra.active_xmult }
      else
        return { xmult = card.ability.extra.inactive_xmult }
      end
    end
  end
}
