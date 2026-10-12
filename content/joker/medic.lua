SMODS.Joker {
  key = "medic",
  config = {
    extra = {
      enhancement = 'm_paperback_bandaged',
    }
  },
  attributes = {
    'retrigger',
    'enhancements'
  },
  rarity = 2,
  pos = { x = 8, y = 10 },
  atlas = "jokers_atlas",
  cost = 6,
  unlocked = false,
  discovered = false,
  blueprint_compat = false,
  eternal_compat = true,
  perishable_compat = true,
  paperback = {
    requires_enhancements = true,
  },
  enhancement_gate = 'm_paperback_bandaged',

  paperback_credit = {
    coder = { 'srockw' },
  },

  locked_loc_vars = function(self, info_queue, card)
    return { vars = { 2 } }
  end,

  check_for_unlock = function (self, args)
    return G.GAME.paperback.num_bandages_broken_last_hand >= 2
  end,

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.m_paperback_bandaged

    return {
      vars = {
        localize {
          type = 'name_text',
          set = 'Enhanced',
          key = card.ability.extra.enhancement
        }
      }
    }
  end,

  add_to_deck = function(self, card, from_debuff)
    G.GAME.paperback.bandaged_inc = G.GAME.paperback.bandaged_inc + 1
  end,

  remove_from_deck = function(self, card, from_debuff)
    G.GAME.paperback.bandaged_inc = G.GAME.paperback.bandaged_inc - 1
  end
}
