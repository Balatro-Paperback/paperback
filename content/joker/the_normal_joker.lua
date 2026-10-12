SMODS.Joker {
  key = "the_normal_joker",
  config = {
    extra = {
      rarity = 1
    }
  },
  attributes = {
    'retrigger',
    'joker',
    'music'
  },
  pools = {
    Music = true
  },
  rarity = 3,
  pos = { x = 11, y = 0 },
  atlas = "jokers_atlas",
  cost = 8,
  unlocked = false,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,

  paperback_credit = {
    coder = { 'srockw' }
  },

  check_for_unlock = function(self, args)
    if args.type == 'modify_jokers' and G.jokers then
      local count = 0

      for _, v in ipairs(G.jokers.cards) do
        local rarity = v.config.center.rarity
        if rarity == 1 then count = count + 1 end
      end

      return count >= 5
    end
  end,

  locked_loc_vars = function (self, info_queue, card)
    return { vars = { 5 }}
  end,

  calculate = function(self, card, context)
    if context.retrigger_joker_check and PB_UTIL.is_card(context.other_card) then
      if context.other_card.config.center.rarity == card.ability.extra.rarity then
        return {
          repetitions = 1
        }
      end
    end
  end,

  joker_display_def = function(JokerDisplay)
    return {
      retrigger_joker_function = function(card, retrigger_joker)
        return card.config.center.rarity == retrigger_joker.ability.extra.rarity and 1 or 0
      end
    }
  end,
}
