SMODS.Joker {
  key = 'deadringer',
  config = {
    extra = {
      ["Ace"] = 1,
      ["7"] = 1,
      ["9"] = 2
    }
  },
  attributes = {
    'retrigger',
    'rank',
    'ace',
    'nine',
    'seven',
    'music'
  },
  pools = {
    Music = true
  },
  rarity = 3,
  pos = { x = 4, y = 8 },
  atlas = 'jokers_atlas',
  cost = 7,
  unlocked = false,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,
  paperback_credit = {
    coder = { 'srockw' },
  },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        localize("Ace", 'ranks'),
        localize("7", 'ranks'),
        localize("9", 'ranks'),
      }
    }
  end,

  locked_loc_vars = function(self, info_queue, card)
    return {
      vars = {
        3
      }
    }
  end,

  check_for_unlock = function(self, args)
    local jacks = 0
    if args.type == 'hand_contents' then
      for i = 1, #args.cards do
        local v = args.cards[i]
        if SMODS.has_enhancement(v, 'm_wild') and PB_UTIL.is_rank(v, 'Jack') then
          jacks = jacks + 1
        end
      end
      if jacks >= 3 then
        return true
      end
    end
  end,

  calculate = function(self, card, context)
    if context.cardarea == G.play and context.repetition and not SMODS.has_no_rank(context.other_card) then
      local reps = card.ability.extra[context.other_card.base.value]

      if reps then
        return {
          repetitions = reps
        }
      end
    end
  end,

  joker_display_def = function(JokerDisplay)
    return {
      reminder_text = {
        { text = '(', colour = G.C.UI.TEXT_INACTIVE },
        { text = 'Ace', colour = G.C.IMPORTANT },
        { text = ', ', colour = G.C.UI.TEXT_INACTIVE },
        { text = '7', colour = G.C.IMPORTANT },
        { text = ', ', colour = G.C.UI.TEXT_INACTIVE },
        { text = '9', colour = G.C.IMPORTANT },
        { text = 'x2)', colour = G.C.UI.TEXT_INACTIVE },
      },
    }
  end,
}
