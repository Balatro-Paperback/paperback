SMODS.Joker {
  key = "seven_stars",
  config = {
    extra = {
      suit = "paperback_Stars"
    }
  },
  attributes = {
    'suit',
    'stars',
    'rettrigger'
  },
  rarity = 3,
  pos = { x = 2, y = 13 },
  atlas = "jokers_atlas",
  cost = 8,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,
  paperback = {
    requires_stars = true
  },
  paperback_credit = {
    coder = { 'thermo' }
  },
  unlocked = false,

  locked_loc_vars = function (self, info_queue, card)
    return { vars = { 7 }}
  end,

  check_for_unlock = function (self, args)
    if G.GAME.round >= 1 then
      local count = 0
      for _, v in ipairs(G.playing_cards or {}) do
        if v.base.suit == ("paperback_Stars") then 
          count = count + 1
        end
      end
      return count == 7
    end
  end,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        localize(card.ability.extra.suit, 'suits_plural')
      }
    }
  end,

  calculate = function(self, card, context)
    if context.repetition and context.cardarea == G.play and context.other_card:is_suit(card.ability.extra.suit) then
      return {
        repetitions = 1
      }
    end
  end
}
