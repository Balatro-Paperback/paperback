SMODS.Joker {
  key = "vacation_juice",
  config = {
    extra = {
      drank_after = 2
    }
  },
  rarity = 3,
  pos = { x = 14, y = 9 },
  atlas = "jokers_atlas",
  cost = 10,
  unlocked = true,
  discovered = false,
  blueprint_compat = false,
  eternal_compat = false,
  pools = {
    Food = true
  },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.drank_after,
        card.ability.extra.drank_after == 1 and "" or "s"
      }
    }
  end,

  calculate = function(self, card, context)
    if not context.blueprint and context.end_of_round and context.main_eval
    and not G.GAME.paperback.vacation_juice_trigger
    and G.GAME.paperback.last_blind_type_defeated_this_ante ~= G.GAME.blind:get_type() then
      card.ability.extra.drank_after = card.ability.extra.drank_after - 1
      G.GAME.paperback.vacation_juice_trigger = true

      if card.ability.extra.drank_after <= 0 then
        PB_UTIL.destroy_joker(card)
        return {
          message = localize('k_drank_ex'),
          colour = G.C.FILTER
        }
      else
        return {
          message = localize {
            type = 'variable',
            key = 'a_remaining',
            vars = { card.ability.extra.drank_after }
          }
        }
      end
    end
  end,
}
