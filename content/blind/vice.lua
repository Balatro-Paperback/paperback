SMODS.Blind {
  key = "vice",
  boss = { min = 3 },
  attributes = { "hand_type" },
  boss_colour = HEX("8f79be"),
  atlas = "wingding_blinds_atlas",
  pos = { y = 21 },

  loc_vars = function(self)
    return { vars = { localize(G.GAME.current_round.most_played_poker_hand, "poker_hands") } }
  end,
  collection_loc_vars = function(self)
    return { vars = { localize("ph_most_played") } }
  end,

  calculate = function(self, blind, context)
    if blind.disabled then return end

    if context.before and not blind.effect.debuffed then
      if context.scoring_name == G.GAME.current_round.most_played_poker_hand then
        blind.effect.debuffed = true
        for i, v in ipairs(context.full_hand) do
          v.ability.paperback_vice = true
          SMODS.recalc_debuff(v)
        end
      end
    end

    if context.debuff_card and context.debuff_card.ability.paperback_vice then
      return { debuff = true }
    end
  end
}
