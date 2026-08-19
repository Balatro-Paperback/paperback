SMODS.Joker {
  key = "ampersand",
  config = {
    extra = {
      retriggers = 1,
      is_white = true,
    }
  },
  attributes = {
    'retrigger',
    'dark',
    'light',
    'music'
  },
  rarity = 1,
  pos = { x = 23, y = 6 },
  atlas = "jokers_atlas",
  cost = 3,
  unlocked = false,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,

  pools = {
    Music = true
  },
  paperback_credit = {
    coder = { 'dowfrin' }
  },
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = PB_UTIL.suit_tooltip('dark')
    info_queue[#info_queue + 1] = PB_UTIL.suit_tooltip('light')

    return {
      vars = {
        card.ability.extra.retriggers
      }
    }
  end,

  locked_loc_vars = function(self, info_queue, card)
    return { vars = { localize('Two Pair', 'poker_hands'), 2 } }
  end,
  check_for_unlock = function(self, args)
    return args.type == 'paperback_two_pair_light_dark'
  end,

  calculate = function(self, card, context)
    if context.cardarea == G.play and context.repetition then
      local cards = {
        dark = nil,
        light = nil,
        wild = {}
      }
      local counter = 0

      for _, v in ipairs(context.scoring_hand) do
        local is_dark = PB_UTIL.is_suit(v, 'dark', false, true)
        local is_light = PB_UTIL.is_suit(v, 'light', false, true)
        if is_dark and is_light then
          cards.wild[#cards.wild + 1] = v
          counter = counter + 1
        elseif is_dark and not cards.dark then
          cards.dark = v
          counter = counter + 1
        elseif is_light and not cards.light then
          cards.light = v
          counter = counter + 1
        end
        if counter >= 2 then break end
      end

      if counter >= 2 and (cards.dark == context.other_card or cards.light == context.other_card or PB_UTIL.find(cards.wild, context.other_card)) then
        local BGcolour
        if card.ability.extra.is_white then
          BGcolour = G.C.BLACK
          if not context.blueprint then
            card.ability.extra.is_white = false
          end
        else
          if not context.blueprint then
            card.ability.extra.is_white = true
          end
          BGcolour = G.C.PAPERBACK_SOLEMN_WHITE
        end

        return {
          repetitions = card.ability.extra.retriggers,
          colour = BGcolour
        }
      end
    end
  end,
}
