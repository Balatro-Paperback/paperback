SMODS.Joker {
  key = "whitebeard",
  config = {
    extra = {
      xmult = 1.5
    }
  },
  attributes = {
    'xmult',
    'destroy_cards',
    'red',
    'boss_blind'
  },
  rarity = 3,
  pos = { x = 24, y = 9 },
  atlas = "jokers_atlas",
  cost = 8,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,
  paperback_credit = {
    coder = { 'thermo' }
  },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.xmult
      }
    }
  end,

  calculate = function(self, card, context)
    if G.GAME.blind.boss and context.individual and context.cardarea == G.play then
      return {
        xmult = card.ability.extra.xmult
      }
    end
    if G.GAME.blind.boss and context.after and (SMODS.calculate_round_score() + G.GAME.chips) > G.GAME.blind.chips then
      SMODS.destroy_cards(G.play.cards)
      return {
        message = localize('paperback_whitebeard_death_ex'),
        colour = G.C.MULT
      }
    end
  end
}
