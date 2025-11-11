SMODS.Joker {
  key = 'aurora_borealis',
  config = {
    extra = {
      a_xmult = 0.5,
    }
  },
  rarity = 2,
  pos = { x = 15, y = 10 },
  atlas = 'jokers_atlas',
  cost = 6,
  unlocked = false,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,
  soul_pos = nil,

  locked_loc_vars = function(self, info_queue, card)
    return { vars = { 3 } }
  end,
  unlock_condition = { type = 'modify_jokers', extra = { polychrome = true, count = 3 } },

  loc_vars = function(self, info_queue, card)
    local xmult
    if G.jokers then
      local count = 0
      for k, v in ipairs(G.jokers.cards) do
        if v.edition and not v.edition.negative then
          count = count + 1
        end
      end
      xmult = 1 + (count * card.ability.extra.a_xmult)
    end
    return {
      vars = {
        card.ability.extra.a_xmult,
        xmult or 1
      }
    }
  end,

  calculate = function(self, card, context)
    if context.joker_main then
      local xmult
      local count = 0
      for k, v in ipairs(G.jokers.cards) do
        if v.edition and not v.edition.negative then
          count = count + 1
        end
      end
      xmult = 1 + (count * card.ability.extra.a_xmult)
      return {
        xmult = xmult
      }
    end
  end,

  joker_display_def = function(JokerDisplay)
    return {
      text = {
        {
          border_nodes = {
            { text = "X" },
            { ref_table = "card.joker_display_values", ref_value = "xmult", retrigger_type = "exp" }
          }
        }
      },
      calc_function = function(card)
        local xmult = 1
        if G.jokers then
          local count = 0
          for k, v in ipairs(G.jokers.cards) do
            if v.edition and not v.edition.negative then
              count = count + 1
            end
          end
          xmult = 1 + (count * card.ability.extra.a_xmult)
        end
        card.joker_display_values.xmult = xmult
      end
    }
  end,
}
