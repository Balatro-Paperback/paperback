PB_UTIL.MinorArcana {
  key = 'ten_of_swords',
  config = {
    max_highlighted = 1,
  },
  attributes = {
    'destroy_card',
    'rank',
    'full_deck'
  },
  atlas = 'minor_arcana_atlas',
  pos = { x = 2, y = 5 },
  paperback_credit = {
    coder = { 'dowfrin' }
  },

  use = function(self, card, area)
    PB_UTIL.use_consumable_animation(card, G.hand.highlighted, function()
      for _, k in ipairs(G.hand.highlighted) do
        local cards = {}
        if SMODS.has_no_rank(k) then
          for _, v in ipairs(G.playing_cards) do
            if SMODS.has_no_rank(v) then
              table.insert(cards, v)
            end
          end
        else
          for _, v in ipairs(G.playing_cards) do
            if PB_UTIL.is_rank(v, k:get_id()) then
              table.insert(cards, v)
            end
          end
        end
        SMODS.destroy_cards(cards)
      end
    end)
  end
}
