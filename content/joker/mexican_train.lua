SMODS.Joker {
  key = "mexican_train",
  config = {
    extra = {
      dollars = 1,
    }
  },
  rarity = 1,
  pos = { x = 17, y = 10 },
  atlas = "jokers_atlas",
  cost = 6,
  blueprint_compat = false,
  eternal_compat = true,
  perishable_compat = true,
  enhancement_gate = 'm_paperback_domino',
  paperback = {
    requires_enhancements = true
  },

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.m_paperback_domino
    local count = 0
    local table = {}
    if G.play and G.play.cards[1] then
      table = G.play.cards
    else
      if G.hand and G.hand.highlighted and G.hand.highlighted[1] then
        table = G.hand.highlighted
      end
    end

    for _, v in ipairs(table) do
      local debuff_check = not v.debuff
      if SMODS.has_enhancement(v, 'm_paperback_domino') and debuff_check then
        count = (count or 0) + 1
      end
    end
    return {
      vars = {
        localize {
          type = 'name_text',
          set = 'Enhanced',
          key = 'm_paperback_domino'
        },
        card.ability.extra.dollars,
        card.ability.extra.dollars * count,
      }
    }
  end,

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      if SMODS.has_enhancement(context.other_card, 'm_paperback_domino') then
        local count = 0
        for _, v in ipairs(G.play.cards or {}) do
          local debuff_check = not v.debuff
          if SMODS.has_enhancement(v, 'm_paperback_domino') and debuff_check then
            count = (count or 0) + 1
          end
        end
        return {
          dollars = card.ability.extra.dollars * count
        }
      end
    end
  end
}
