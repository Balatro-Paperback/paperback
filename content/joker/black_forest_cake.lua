SMODS.Joker {
  key = "black_forest_cake",
  config = {
    extra = {
      mult = 2,
      a_mult = 2
    }
  },
  rarity = 1,
  pos = { x = 13, y = 10 },
  atlas = "jokers_atlas",
  cost = 3,
  unlocked = true,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = false,
  perishable_compat = false,
  soul_pos = nil,
  pools = {
    Food = true
  },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.mult,
        card.ability.extra.a_mult,
      }
    }
  end,

  calculate = function(self, card, context)
    if context.joker_main and card.ability.extra.mult > 0 then
      return {
        mult = card.ability.extra.mult,
      }
    end

    if not context.blueprint and context.end_of_round and context.main_eval then
      card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.a_mult
      return {
        message = localize('k_upgrade_ex'),
        card = card,
        colour = G.C.MULT,
      }
    end

    if not context.blueprint and PB_UTIL.count_destroyed_things(context) > 0
    and not (context.paperback and context.paperback.destroyed_joker and card == context.paperback.destroyed_joker)
    then
      PB_UTIL.destroy_joker(card)
      return {
        message = localize('k_eaten_ex'),
        colour = G.C.FILTER
      }
    end
  end,

  joker_display_def = function(JokerDisplay)
    return {
      text = {
        { text = "+" },
        { ref_table = "card.ability.extra", ref_value = "mult", retrigger_type = "mult" }
      },
      text_config = { colour = G.C.MULT },
    }
  end,
}
