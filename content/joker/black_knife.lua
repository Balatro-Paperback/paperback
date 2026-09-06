SMODS.Joker {
  key = "black_knife",
  config = {
    extra = {
      destroy = 10,
      left = 10,
      odds = 10,
    }
  },
  attributes = {
    "destroy_card",
    "negative",
    'light',
    'chance'
  },
  rarity = 3,
  pos = { x = 8, y = 13 },
  atlas = "jokers_atlas",
  cost = 9,
  unlocked = false,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,
  paperback_credit = {
    coder = { 'infinityplus' }
  },

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = PB_UTIL.suit_tooltip('light')
    local numerator, denominator = PB_UTIL.chance_vars(card)
    return {
      vars = {
        card.ability.extra.destroy, card.ability.extra.left, numerator, denominator
      }
    }
  end,

  locked_loc_vars = function(self, info_queue, card)
    return { vars = { 100, PB_UTIL.get_career_stat("played_stars", 0) } }
  end,

  check_for_unlock = function(self, args)
    return args.type == "paperback_played_stars" and args.total >= 100
  end,

  calculate = function(self, card, context)
    if context.remove_playing_cards then
      for _, v in ipairs(context.removed or {}) do
        if PB_UTIL.is_suit(v, 'light') then
          card.ability.extra.left = card.ability.extra.left - 1
          if card.ability.extra.left <= 0 then
            card.ability.extra.left = card.ability.extra.destroy
            G.E_MANAGER:add_event(Event {
              trigger = 'immediate',
              func = function()
                  SMODS.add_card({
                    set = 'Joker',
                    area = G.jokers,
                    edition = 'e_negative',
                  })
                return true
              end,
            })
          end
        end
      end
    end

    if context.after and not context.blueprint then
        for _, v in ipairs(context.scoring_hand) do
        if PB_UTIL.is_suit(v, 'light') and PB_UTIL.chance(card, "paperback_SWOON") then
          local possible_jokers = {}
            for _, j in ipairs(G.jokers.cards) do
                if j ~= card and not SMODS.is_eternal(j, card) and not j.getting_sliced then
                    possible_jokers[#possible_jokers + 1] = j
                end
            end

            local joker_to_destroy = pseudorandom_element(possible_jokers, pseudoseed('paperback_SWOON'))

            if joker_to_destroy then
                PB_UTIL.destroy_joker(joker_to_destroy)
                SMODS.calculate_effect {
                    message = localize('paperback_swoon_ex'),
                    colour = G.C.PAPERBACK_DARK_SUIT,
                    card = card,
                }
            end
        end
      end
    end
  end,

  
}
