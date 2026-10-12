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
  unlocked = false,

  check_for_unlock = function(self, args)
    if args.type == 'round_win' then
      return G.GAME.paperback.round.played_only_ace_or_king and G.GAME.blind.boss
      -- additional check in case you beat the boss blind without playing a hand... somehow
      and G.GAME.current_round.hands_played >= 1
    end
  end,

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
