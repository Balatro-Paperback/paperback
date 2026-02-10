SMODS.Joker {
  key = "jokers_11",
  config = {
    extra ={
      rank = "Ace"
    }
  },
  rarity = 3,
  pos = { x = 13, y = 7 },
  atlas = "jokers_atlas",
  cost = 8,
  unlocked = false,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,
  soul_pos = nil,

  paperback_credit = {
    coder = { 'vitellary' },
  },

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.rank}}
  end,

  locked_loc_vars = function(self, info_queue, card)
    return { vars = { 11 } }
  end,

  check_for_unlock = function(self, args)
    if args.type == 'modify_deck' then
      local count = 0
      for _, v in ipairs(G.playing_cards or {}) do
        if PB_UTIL.is_rank(v, "Ace") then
          count = count + 1
          if count >= 11 then
            return true
          end
        end
      end
      return false
    end
  end,

  calculate = function(self, card, context)
    if context.end_of_round and context.individual and context.cardarea == G.hand then
      if PB_UTIL.is_rank(context.other_card, card.ability.extra.rank) then
        return {
          message = localize('paperback_plus_tag'),
          func = function()
            G.E_MANAGER:add_event(Event({
              func = function()
                PB_UTIL.add_tag(PB_UTIL.poll_tag("jokers_11"))
                return true
              end
            }))
          end
        }
      end
    end
  end
}
