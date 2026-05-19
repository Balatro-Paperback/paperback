SMODS.Joker {
  key = "hamsa_r",
  config = {
    extra = {
      luck = 3,
      ready = false,
    },
  },
  attributes = {
    'hands',
    'mod_chance'
  },
  rarity = 1,
  pos = { x = 22, y = 6 },
  atlas = "jokers_atlas",
  cost = 5,
  unlocked = false,
  discovered = false,
  blueprint_compat = false,
  eternal_compat = true,
  perishable_compat = true,
  paperback_credit = {
    coder = { 'vitellary' },
  },

  loc_vars = function(self, info_queue, card)
    local vars = { vars = { card.ability.extra.luck } }
    if card.area and card.area.config.collection then
      vars.key = 'j_paperback_hamsa_r_collection'
    end

    return vars
  end,

  locked_loc_vars = function(self, info_queue, card)
    local name = localize('k_unknown')

    if G.P_CENTERS['j_paperback_hamsa'].unlocked then
      name = localize { type = 'name_text', set = 'Joker', key = 'j_paperback_hamsa' }
    end

    return {
      vars = {
        name,
        1
      }
    }
  end,

  -- can only be obtained from having the initial hamsa
  in_pool = function(self, args)
    return false
  end,

  calculate = function(self, card, context)
    if context.hand_drawn and not context.blueprint then
      card.ability.extra.ready = true
    end

    if context.press_play and not context.blueprint then
      card.ability.extra.ready = false
    end

    if context.mod_probability then
      local active = (G.GAME.current_round.hands_left == 0)
          or (G.GAME.current_round.hands_left == 1 and card.ability.extra.ready)

      if active then
        return {
          numerator = context.numerator + card.ability.extra.luck
        }
      end
    end

    if not context.blueprint and context.end_of_round and context.main_eval then
      PB_UTIL.use_consumable_animation(nil, card, function()
        card:set_ability(G.P_CENTERS['j_paperback_hamsa'])
      end)

      return {
        message = localize('paperback_hamsa_reverse'),
        colour = G.C.FILTER
      }
    end
  end
}
