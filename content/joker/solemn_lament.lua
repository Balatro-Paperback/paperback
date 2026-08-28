SMODS.Joker {
  key = "solemn_lament",
  config = {
    extra = {
      x_mult_mod = 0.15,
      x_mult = 1,
      is_white = true
    }
  },
  attributes = {
    'xmult',
    'scaling',
    'suit',
    'dark',
    'light'
  },
  rarity = 3,
  pos = { x = 3, y = 1 },
  atlas = "jokers_atlas",
  cost = 8,
  unlocked = false,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = false,
  soul_pos = nil,

  paperback_credit = {
    coder = { 'dowfrin' }
  },
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = PB_UTIL.suit_tooltip('dark')
    info_queue[#info_queue + 1] = PB_UTIL.suit_tooltip('light')

    return {
      vars = {
        card.ability.extra.x_mult_mod,
        card.ability.extra.x_mult

      }
    }
  end,

  check_for_unlock = function(self, args)
    if G.playing_cards then
      for k, v in pairs(G.playing_cards) do
        if v.paperback_num_times_played and v.paperback_num_times_played >= 8 then
          return true
        end
      end
    end
  end,

  locked_loc_vars = function(self, info_queue, card)
    return {
      vars = {
        8
      }
    }
  end,

  calculate = function(self, card, context)
    if context.before and not context.blueprint then
      local suits = {
        dark = 0,  -- max 1
        light = 0, -- max 1
        wild = 0,  -- can fill in for the others
      }

      for _, v in ipairs(context.scoring_hand) do
        local is_dark = PB_UTIL.is_suit(v, 'dark', false, true)
        local is_light = PB_UTIL.is_suit(v, 'light', false, true)
        if is_dark and is_light then
          suits.wild = suits.wild + 1
        elseif is_dark then
          suits.dark = 1
        elseif is_light then
          suits.light = 1
        end
      end

      if suits.dark + suits.light + suits.wild >= 2 then
        local BGcolour
        if card.ability.extra.is_white then
          BGcolour = G.C.BLACK
          card.ability.extra.is_white = false
        else
          BGcolour = G.C.PAPERBACK_SOLEMN_WHITE
          card.ability.extra.is_white = true
        end
        SMODS.scale_card(card, {
          ref_table = card.ability.extra,
          ref_value = 'x_mult',
          scalar_value = 'x_mult_mod',
          message_key = 'a_xmult',
          message_colour = BGcolour
        })
        return nil, true
      end
    end

    if context.joker_main then
      return {
        x_mult = card.ability.extra.x_mult,
      }
    end
  end,

  joker_display_def = function(JokerDisplay)
    return {
      text = {
        {
          border_nodes = {
            { text = "X" },
            { ref_table = "card.ability.extra", ref_value = "x_mult", retrigger_type = "exp" }
          }
        }
      },
    }
  end,
}
