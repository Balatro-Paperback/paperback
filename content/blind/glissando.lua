SMODS.Blind {
  key = 'glissando',
  boss = {
    min = 3
  },
  attributes = {
    'debuff',
    'rank'
  },
  mult = 2,
  boss_colour = HEX('E689CD'),
  atlas = 'music_blinds_atlas',
  pos = { y = 9 },

  recalc_debuff = function(self, card, from_blind)
    if SMODS.has_no_rank(card) and (G.GAME.paperback.highest_rank_this_round or 0) > 0 then
      return true
    end
    if PB_UTIL.compare_ranks(G.GAME.paperback.highest_rank_this_round, card:get_id()) then
      return true
    end
  end,

  calculate = function(self, blind, context)
    if context.before then
      local highest = G.GAME.paperback.highest_rank_this_round or context.scoring_hand[1]:get_id()
      for i, v in ipairs(context.scoring_hand) do
        if PB_UTIL.compare_ranks(v:get_id(), highest) or highest < 0 then
          highest = v:get_id()
        end
      end
      G.GAME.paperback.highest_rank_this_round = highest
    end

    if context.hand_drawn and not blind.disabled then
      for _, v in ipairs(G.playing_cards) do
        SMODS.recalc_debuff(v)
      end
    end
  end
}
