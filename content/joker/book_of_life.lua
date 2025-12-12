SMODS.Joker {
  key = "book_of_life",
  config = {
    extra = {
      odds = 2,
    },
  },
  rarity = 3,
  pos = { x = 14, y = 7 },
  atlas = "jokers_atlas",
  cost = 8,
  unlocked = true,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = false,
  perishable_compat = true,
  soul_pos = nil,

  loc_vars = function(self, info_queue, card)
    return { vars = { PB_UTIL.chance_vars(card) } }
  end,

  calculate = function(self, card, context)
    local tag_key
    if context.end_of_round and context.main_eval then
      tag_key = G.GAME.round_resets.blind_tags[G.GAME.blind_on_deck]
    elseif context.skip_blind then
      local prev_blind = (G.GAME.blind_on_deck == 'Boss' and 'Big') or (G.GAME.blind_on_deck == 'Big' and 'Small')
      tag_key = G.GAME.round_resets.blind_tags[prev_blind]
    end
    if tag_key ~= nil and PB_UTIL.chance(card, 'book_of_life') then
      return {
        message = localize('paperback_plus_tag'),
        func = function()
          G.E_MANAGER:add_event(Event({
            func = function()
              PB_UTIL.add_tag(tag_key)
              return true
            end
          }))
        end
      }
    end
  end
}
