SMODS.Joker {
  key = "clippy",
  attributes = {
    'paperclip'
  },
  rarity = 2,
  pos = { x = 15, y = 6 },
  soul_pos = { x = 16, y = 6 },
  atlas = "jokers_atlas",
  cost = 7,
  unlocked = true,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,
  paperback = {
    requires_paperclips = true
  },
  paperback_credit = {
    coder = { 'dowfrin' },
  },

  calculate = function(self, card, context)
    local unclipped = {}
    if context.setting_blind then
      local clip = PB_UTIL.poll_paperclip "clippy"
      for _, v in ipairs(G.playing_cards) do
        if not PB_UTIL.has_paperclip(v) then
          table.insert(unclipped, v)
        end
      end
      if #unclipped == 0 then
        return {
          message = localize("paperback_clippy_msg_full")
        }
      end
      local _card = pseudorandom_element(unclipped, pseudoseed("clippy"))
      PB_UTIL.set_paperclip(_card, clip)
      local key = "paperback_clippy_msg_" .. math.random(1, 8)
      return {
        message = localize(key)
      }
    end
  end
}
