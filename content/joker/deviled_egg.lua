SMODS.Joker {
  key = 'deviled_egg',
  config = {
    extra = {
      rounds_left = 5,
      enabled = true
    }
  },
  rarity = 1,
  pos = { x = 16, y = 2 },
  atlas = 'jokers_atlas',
  cost = 5,
  unlocked = true,
  discovered = false,
  blueprint_compat = false,
  eternal_compat = false,
  perishable_compat = true,
  pools = {
    Food = true
  },

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.rounds_left } }
  end,

  calculate = function(self, card, context)
    if context.before and not context.blueprint and card.ability.extra.enabled then
      card.ability.extra.enabled = false
      local to_gold = context.scoring_hand[1]

      if not SMODS.has_enhancement(to_gold, 'm_gold') then
        to_gold:set_ability('m_gold', nil, true)
        G.E_MANAGER:add_event(Event({
          func = function()
            to_gold:juice_up()
            return true
          end
        }))
        return {
          message = localize('k_gold'),
          colour = G.C.MONEY
        }
      end
    end

    if context.end_of_round and context.cardarea == G.jokers then
      card.ability.extra.enabled = true
      card.ability.extra.rounds_left = card.ability.extra.rounds_left - 1
      if card.ability.extra.rounds_left == 0 then
        PB_UTIL.destroy_joker(card)
        return {
          message = localize('k_eaten_ex'),
          colour = G.C.FILTER
        }
      end
    end
  end,

  joker_display_def = function(JokerDisplay)
    return {
      reminder_text = {
        { text = "(" },
        { ref_table = "card.ability.extra", ref_value = "rounds_left" },
        { text = "/" },
        { ref_table = "card.config.center.config.extra", ref_value = "rounds_left" },
        { text = ")" },
      },
    }
  end,
}
