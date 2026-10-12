SMODS.Joker {
  key = "hatred",
  config = {
    extra = {
      xmult = 1.5,
      mark_new = true,
      discarded = false
    }
  },
  attributes = {
    'xmult',
    'destroy_cards'
  },
  rarity = 2,
  pos = { x = 10, y = 12 },
  atlas = "jokers_atlas",
  cost = 5,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,
  unlocked = false,
  paperback_credit = {
    coder = { 'dowfrin' },
    artist = { 'shizi' }
  },

  check_for_unlock = function(self, args)
    if G.GAME.round >= 1 then
      for _, v in ipairs(G.playing_cards or {}) do
        if v.base.suit == ('Hearts') then 
          return false
        end
      end
      return true
    end
  end,
  
  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.xmult
      }
    }
  end,

  calculate = function(self, card, context)
    local function mark_card()
      -- Mark a random card that isn't already marked
      local targets = {}
      for _, _card in ipairs(G.hand.cards) do
        if not card.ability.paperback_hatred_mark then
          targets[#targets + 1] = _card
        end
      end

      local marked = pseudorandom_element(G.hand.cards, 'hatred_mark')

      if marked then
        card.ability.extra.mark_new = false
        marked.ability.paperback_hatred_mark = true
        juice_card_until(marked, function() return marked.ability.paperback_hatred_mark end, true)
        G.E_MANAGER:add_event(Event {
          trigger = 'immediate',
          delay = 0.5,
          func = function()
            save_run()
            return true
          end
        })
      end
    end

    if context.individual and context.cardarea == G.play then
      if context.other_card.ability.paperback_hatred_mark then
        return {
          xmult = card.ability.extra.xmult
        }
      end
    end

    -- Checks for destroying the marked card
    if not context.blueprint then
      local destroyed = false
      if context.discard and context.other_card.ability.paperback_hatred_mark then
        card.ability.extra.mark_new = false
        card.ability.extra.discarded = true
        return {
          remove = true,
          message = localize('paperback_hatred_death_ex'),
          colour = G.C.MULT
        }
      end

      if context.destroy_card and context.cardarea == 'unscored' and context.destroy_card.ability.paperback_hatred_mark then
        return {
          remove = true,
          message = localize('paperback_hatred_death_ex'),
          colour = G.C.MULT
        }
      end

      if context.after then
        for i, v in ipairs(context.full_hand) do
          if v.ability.paperback_hatred_mark then
            card.ability.extra.mark_new = true
          end
        end
        for i, v in ipairs(G.hand.cards) do
          if v.ability.paperback_hatred_mark then
            card.ability.extra.mark_new = true
            SMODS.destroy_cards({ v })
            destroyed = true
          end
        end
        if card.ability.extra.discarded then
          card.ability.extra.mark_new = true
        end
        for i, v in ipairs(context.scoring_hand) do
          v.ability.paperback_hatred_mark = nil
        end
        if #G.hand.cards >= G.hand.config.card_limit then
          mark_card()
        end
      end
      if destroyed then
        return {
          message = localize('paperback_hatred_death_ex'),
          colour = G.C.MULT
        }
      end
      if context.hand_drawn and (context.first_hand_drawn or card.ability.extra.mark_new) then
        mark_card()
      end
    end
  end,

  remove_from_deck = function(self, card, from_debuff)
    for i, v in ipairs(G.playing_cards) do
      v.ability.paperback_hatred_mark = nil
    end
  end
}
