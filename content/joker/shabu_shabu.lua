SMODS.Joker {
  key = "shabu_shabu",
  config = {
    extra = {
      slots = 3,
      decrement = 1
    }
  },
  attributes = {
    'joker',
    'boss_blind',
    'food',
    'red'
  },
  rarity = 3,
  pos = { x = 17, y = 12 },
  atlas = "jokers_atlas",
  cost = 10,
  blueprint_compat = false,
  eternal_compat = false,
  perishable_compat = true,
  unlocked = false,

  pools = {
    Food = true
  },

  paperback = {
    coder = { 'thermo' }
  },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.slots, card.ability.extra.decrement
      }
    }
  end,

  calculate = function(self, card, context)
    if context.end_of_round and G.GAME.blind.boss and context.main_eval and not context.blueprint_card then
      if (card.ability.extra.slots - card.ability.extra.decrement <= 0) then
        PB_UTIL.destroy_joker(card)
        return {
          message = localize('k_eaten_ex'),
          colour = G.C.MULT,
          card = card
        }
      end
      local change = card.ability.extra.slots
      SMODS.scale_card(card, {
        ref_table = card.ability.extra,
        ref_value = 'slots',
        scalar_value = 'decrement',
        operation = '-',
        scaling_message = {
          message = localize('paperback_downgrade_ex'),
          colour = G.C.ORANGE
        }
      })
      change = change - card.ability.extra.slots
      if change ~= 0 then
        G.jokers:change_size(-change)
      end
      return nil, true
    end
  end,


  add_to_deck = function(self, card, from_debuff)
    G.jokers:change_size(card.ability.extra.slots)
  end,

  remove_from_deck = function(self, card, from_debuff)
    G.jokers:change_size(-card.ability.extra.slots)
  end,

  check_for_unlock = function(self, args)
    if args.type == 'modify_jokers' and #PB_UTIL.get_owned_food() >= 5 then
      return true
    end
  end,

  locked_loc_vars = function(self, info_queue, card)
    return {
      vars = { 5 }
    }
  end
}
