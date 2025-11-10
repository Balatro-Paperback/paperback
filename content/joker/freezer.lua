SMODS.Joker {
  key = 'freezer',
  rarity = 3,
  pos = { x = 10, y = 6 },
  atlas = 'jokers_atlas',
  cost = 7,
  unlocked = false,
  blueprint_compat = true,
  eternal_compat = true,

  loc_vars = function(self, info_queue, center)
    info_queue[#info_queue + 1] = G.P_CENTERS.e_negative
  end,

  calculate = function(self, card, context)
    if context.end_of_round and context.game_over == false and
    context.main_eval and G.GAME.blind.boss then
      G.E_MANAGER:add_event(Event({
        func = function()
          SMODS.add_card {
            set = 'Food',
            edition = "e_negative",
            key_append = 'freezer'
          }
          return true
        end
      }))
      return {
        message = localize('paperback_freezer_ex'),
        colour = G.C.BLUE,
      }
    end
  end,

  check_for_unlock = function(self, args)
    if args.type == 'modify_jokers' and G.jokers then
      for _, joker in ipairs(G.jokers.cards) do
        if joker.ability.set == 'Joker' and joker.edition and joker.edition.negative
        and PB_UTIL.is_food(joker) then
          return true
        end
      end
    end
    return false
  end
}
