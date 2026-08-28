SMODS.Joker {
  key = 'redscreen',
  config = {
    extra = {
      a_xmult = 0.1,
    }
  },
  attributes = {
    'xmult',
    'suit',
    'scaling',
    'light',
    'red'
  },
  rarity = 2,
  pos = { x = 20, y = 6 },
  atlas = "jokers_atlas",
  cost = 6,
  unlocked = false,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,
  pools = {
    Music = true
  },
  paperback_credit = {
    coder = { 'dowfrin' },
  },


  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = PB_UTIL.suit_tooltip('light')
    info_queue[#info_queue + 1] = PB_UTIL.suit_tooltip('dark')

    local red_tally = PB_UTIL.count_reds()

    return {
      vars = {
        card.ability.extra.a_xmult,
        math.max(1 + (card.ability.extra.a_xmult * red_tally), 1),
      }
    }
  end,

  check_for_unlock = function(self, args)
    if args.type == 'modify_deck' and next(G.playing_cards) then
      for k, v in pairs(G.playing_cards) do
        if not PB_UTIL.is_suit(v, 'light') then return false end
      end
      return true
    end
  end,

  calculate = function(self, card, context)
    if context.joker_main then
      local red_tally = PB_UTIL.count_reds()

      return {
        xmult = math.max(1 + (card.ability.extra.a_xmult * red_tally), 1),
        card = card
      }
    end
  end,

  joker_display_def = function(JokerDisplay)
    return {
      text = {
        { ref_table = "card.joker_display_values", ref_value = "xmult", retrigger_type = "exp" }
      },
      text_config = { colour = G.C.MULT },
      calc_function = function(card)
        local red_tally = PB_UTIL.count_reds()
        card.joker_display_values.mult = PB_UTIL.force_signed(math.max(1 + (card.ability.extra.a_xmult * red_tally), 1))
      end
    }
  end,
}

function PB_UTIL.count_reds()
  local red_tally = 0
  if G.playing_cards then
    for k, v in pairs(G.playing_cards) do
      if PB_UTIL.is_suit(v, 'light', true) then red_tally = red_tally + 1 end
      if PB_UTIL.is_suit(v, 'dark', true) and not SMODS.has_any_suit(v) then red_tally = red_tally - 1 end
    end
  end
  return math.max(red_tally, -10)
end
