SMODS.Joker {
  key = "war_without_reason",
  attributes = {
    'generation',
    'joker',
    'red'
  },
  pools = {
    Music = true
  },

  blueprint_compat = false,
  eternal_compat = true,
  perishable_compat = true,
  rarity = 2,
  cost = 6,

  paperback_credit = {
    coder = { 'dowfrin' },
  },

  pos = { x = 23, y = 0 },
  atlas = "jokers_atlas",

  -- TODO: Add unlock

  calculate = function(self, card, context)
    if context.first_hand_drawn and not context.blueprint then
      local my_pos = nil
      for i = 1, #G.jokers.cards do
        if G.jokers.cards[i] == card then
          my_pos = i
          break
        end
      end

      if my_pos and G.jokers.cards[my_pos + 1] and not SMODS.is_eternal(G.jokers.cards[my_pos + 1], card) and not G.jokers.cards[my_pos + 1].getting_sliced then
        local target = G.jokers.cards[my_pos + 1]
        local cards = {}

        for _, v in ipairs(G.hand.cards) do
          if not PB_UTIL.has_paperclip(v) then
            table.insert(cards, v)
          end
        end

        target.getting_sliced = true
        G.GAME.joker_buffer = G.GAME.joker_buffer - 1
        PB_UTIL.destroy_joker(target)

        if next(cards) then
          local c_target = pseudorandom_element(cards, 'war_without_reason_card')
          PB_UTIL.use_consumable_animation(card, context.other_card, function()
            c_target:set_seal((SMODS.poll_seal {
              key = 'war_without_reason_seal',
              guaranteed = true
            }
            ), nil, true)
          end)
        end
      end
    end
  end
}
