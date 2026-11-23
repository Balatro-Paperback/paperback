SMODS.Blind {
  key = "mistake",
  boss = { min = 5 },
  attributes = { "debuff", "joker", "discard" },
  boss_colour = HEX("838383"),
  atlas = "wingding_blinds_atlas",
  pos = { y = 12 },

  loc_vars = function(self)
    local num, den = SMODS.get_probability_vars(G.GAME.blind or self, 1, 2, "paperback_mistake")
    return { vars = { num, den } }
  end,
  vars = { 1, 2 },

  disable = function(self)
    for _, v in ipairs(G.jokers.cards) do
      if v.ability.paperback_mistaken then v.ability.paperback_mistaken = nil end
    end
  end,

  defeat = function(self)
    for _, v in ipairs(G.playing_cards) do
      if v.ability.paperback_mistaken then v.ability.paperback_mistaken = nil end
    end
  end,

  calculate = function(self, blind, context)
    if blind.disabled then return end

    if context.pre_discard then
      if SMODS.pseudorandom_probability(blind, "paperback_mistake", 1, 2) then
        local to_debuff = {}
        for i, v in ipairs(G.jokers.cards) do
          if not v.ability.paperback_mistaken then
            to_debuff[#to_debuff + 1] = v
          end
        end
        local card = pseudorandom_element(to_debuff)
        card.ability.paperback_mistaken = true
        SMODS.recalc_debuff(card)
        SMODS.calculate_effect( { message = localize("paperback_mistake_debuff"), colour = G.C.RED }, card)
      end
    end

    if context.debuff_card and context.debuff_card.area == G.jokers then
      if context.debuff_card.ability.paperback_mistaken then
        return { debuff = true }
      end
    end
  end
}
