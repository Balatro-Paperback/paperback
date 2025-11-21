SMODS.Joker {
  key = "summoning_circle",
  config = {
    extra = {
      hand = 'Five of a Kind'
    }
  },
  rarity = 3,
  pos = { x = 1, y = 0 },
  atlas = "jokers_atlas",
  cost = 8,
  unlocked = true,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,

  loc_vars = function(self, info_queue, card)
    local main_end

    if G.consumeables then
      for k, v in ipairs(G.consumeables.cards) do
        if v.edition and v.edition.negative then
          main_end = {}
          localize {
            type = 'other',
            key = 'remove_negative',
            nodes = main_end
          }
          break
        end
      end
    end

    return {
      vars = {
        localize(card.ability.extra.hand, 'poker_hands')
      },
      main_end = main_end and main_end[1]
    }
  end,
  in_pool = function(self, args)
    -- Only in pool if you have played a Five of a Kind or a Flush Five
    for k, v in pairs(G.GAME.hands) do
      if string.find(k, "Five of a Kind", nil, true) or string.find(k, "Flush Five", nil, true) or string.find(k, "Spectrum Five", nil, true) then
        if G.GAME.hands[k].played > 0 then
          return true
        end
      end
    end
  end,

  calculate = function(self, card, context)
    if context.before and context.main_eval and next(context.poker_hands[card.ability.extra.hand]) then
      -- Check if there is a card to copy
      if G.consumeables.cards[1] then
        local copied_card
        -- Incantation support
        if next(SMODS.find_mod('incantation')) then
          local total, checked = 0, 0
          for i = 1, #G.consumeables.cards do
            total = total + (G.consumeables.cards[i]:getQty())
          end
          local poll = pseudorandom(pseudoseed('summoning_circle')) * total
          for i = 1, #G.consumeables.cards do
            checked = checked + (G.consumeables.cards[i]:getQty())
            if checked >= poll then
              copied_card = G.consumeables.cards[i]
              break
            end
          end
        else
          copied_card = pseudorandom_element(G.consumeables.cards, pseudoseed('summoning_circle'))
        end

        -- Add the card to the consumable area if possible
        local spawned = PB_UTIL.try_spawn_card {
          card = copied_card,
          strip_edition = copied_card.edition and copied_card.edition.negative,
          func = function(c)
            -- More Incantation support
            if c and next(SMODS.find_mod('incantation')) then
              c.ability.qty = 1
              c:set_cost()
            end
          end }

        if spawned then
          return {
            message = localize('k_duplicated_ex')
          }
        end
      end
    end
  end
}
