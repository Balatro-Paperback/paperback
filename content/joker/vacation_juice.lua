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
  unlocked = false,
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

  locked_loc_vars = function(self, info_queue, card)
    local other_name = localize('k_unknown')
    if G.P_CENTERS['b_paperback_passionate'].unlocked then
      other_name = localize { type = 'name_text', set = 'Back', key = 'b_paperback_passionate' }
    end

    return {
      vars = { other_name }
    }
  end,
  check_for_unlock = function(self, args)
    if args.type == 'win_deck' and (get_deck_win_stake('b_paperback_passionate') >= 1) then
      return true
    end
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
          colour = G.C.BLUE
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
