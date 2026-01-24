SMODS.Joker {
  key = "clothespin",
  rarity = 1,
  pos = { x = 9, y = 9 },
  atlas = "jokers_atlas",
  cost = 6,
  unlocked = true,
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

  in_pool = function(self, args)
    for _, v in ipairs(G.playing_cards or {}) do
      if PB_UTIL.has_paperclip(v) then return true end
    end
  end,

}
