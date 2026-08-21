SMODS.Joker {
  key = "clothespin",
  attributes = {
    'paperclip'
  },
  rarity = 1,
  pos = { x = 9, y = 9 },
  atlas = "jokers_atlas",
  cost = 6,
  unlocked = false,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = false,
  paperback = {
    requires_paperclips = true
  },
  paperback_credit = {
    coder = { 'dowfrin' },
  },

  check_for_unlock = function(self, args)
    if args.type == 'hand_contents' then
      local tally = 0
      for i = 1, #args.cards do
        if PB_UTIL.has_paperclip(args.cards[i]) then
          tally = tally + 1
        end
      end
      return tally >= 5
    end
  end,

  locked_loc_vars = function (self, info_queue, card)
    return { vars = { 5 }}
  end,

  in_pool = function(self, args)
    for _, v in ipairs(G.playing_cards or {}) do
      if PB_UTIL.has_paperclip(v) then return true end
    end
  end,

}
