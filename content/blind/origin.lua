SMODS.Blind {
  key = "origin",
  boss = { min = 2 },
  attributes = { "debuff", "joker", "joker_slot" },
  boss_colour = HEX("639870"),
  atlas = "wingding_blinds_atlas",
  pos = { y = 14 },

  calculate = function(self, blind, context)
    if blind.disabled then return end

    if context.debuff_card and context.debuff_card == G.jokers.cards[1] then
      return { debuff = true }
    end
  end
}

local move_ref = Moveable.drag
function Moveable.drag(self, offset)
  local ret = move_ref(self, offset)
  if self.is and type(self.is) == "function" and self:is(Card) then
    if G and G.GAME and G.GAME.blind and G.GAME.blind.name == 'bl_paperback_origin' then
      SMODS.recalc_debuff(G.jokers.cards[1])
      SMODS.recalc_debuff(G.jokers.cards[2])
    end
  end
  return ret
end
