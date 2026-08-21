SMODS.Sound {
  key = 'ITS-TV-TIME',
  path = 'ITS-TV-TIME.ogg',
}

SMODS.Joker {
  key = "its_tv_time",
  rarity = 1,
  pos = { x = 18, y = 7 },
  atlas = "jokers_atlas",
  cost = 5,
  config = {
    extra = {
      chips = 30,
      suit = 'paperback_Stars'
    }
  },
  attributes = {
    'chips',
    'suit',
    'stars'
  },
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,
  paperback = {
    requires_stars = true
  },
  unlocked = false,
  
  paperback_credit = {
    coder = { 'infinityplus' },
  },

  check_for_unlock = function(self, args)
    for _, v in ipairs(G.playing_cards or {}) do
      if v.base.suit == ('paperback_Stars') and SMODS.has_enhancement(v, 'm_bonus') then
        return true
      end
    end
    return false
  end,

  locked_loc_vars = function(self, info_queue, card)
    return {
      vars = {
        localize(card.ability.extra.suit, 'suits_singular'),
        localize { type = 'name_text', key = 'm_bonus', set = 'Enhanced' },
      }
    }
  end,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        localize(card.ability.extra.suit, 'suits_plural'),
        card.ability.extra.chips
      }
    }
  end,

  add_to_deck = function(self, card, from_debuff)
    if not from_debuff then
      play_sound("paperback_ITS-TV-TIME")
    end
  end,

  calculate = function(self, card, context)
    if context.individual and context.other_card:is_suit(card.ability.extra.suit) and (context.cardarea == G.play) then
      return {
        chips = card.ability.extra.chips
      }
    end
  end
}
