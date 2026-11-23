SMODS.Blind {
  key = "reaping",
  boss = { min = 4 },
  attributes = { "debuff", "rank" },
  boss_colour = HEX("99adba"),
  atlas = "wingding_blinds_atlas",
  pos = { y = 17 },

  in_pool = function(self, args)
    return false
  end,

  disable = function(self)
    G.GAME.paperback.sowed_ranks = nil
  end,

  defeat = function(self)
    G.GAME.paperback.sowed_ranks = nil
  end,

  calculate = function(self, blind, context)
    if blind.disabled then return end

    if context.debuff_card and not SMODS.has_no_rank(context.debuff_card) and G.GAME.paperback.sowed_ranks[context.debuff_card.base.value] then
      return { debuff = true }
    end
  end
}

local gnb_ref = SMODS.get_new_blind
SMODS.get_new_blind = function(blind_type)
  if (not blind_type or blind_type == "boss") and G.GAME.paperback.sowed_ranks then
    return "bl_paperback_reaping"
  end
  return gnb_ref(blind_type)
end
