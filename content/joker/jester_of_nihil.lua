SMODS.Joker {
  key = "jester_of_nihil",
  config = {
    extra = {
      suit = 'Spades',
      debuff_mult = 5,
      mult = 0
    }
  },
  rarity = 3,
  pos = { x = 2, y = 6 },
  atlas = 'jokers_atlas',
  cost = 7,
  unlocked = false,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,
  locked_loc_vars = function(self, info_queue, card)
    return {
      vars = { 4 }
    }
  end,
  -- Unlock taken from Bunco
  check_for_unlock = function(self, args)
    if args.type == 'hand_contents' then
      local tally = 0
        for j = 1, #args.cards do
          if args.cards[j].debuff then
            tally = tally + 1
          end
        end
      if tally >= 4 then
        return true
      end
    end
  end,

  set_ability = function(self, card, initial, delay_sprites)
    card.ability.extra.suit = G.GAME.paperback.last_scored_suit
  end,

  add_to_deck = function(self, card, from_debuff)
    -- Whenever this card is added to deck, update the debuffed
    -- status of all playing cards, this is mostly relevant when
    -- added in the middle of a blind
    for k, v in ipairs(G.playing_cards) do
      G.GAME.blind:debuff_card(v)
    end
  end,

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = {
      set = 'Other',
      key = 'debuffed_playing_card'
    }

    return {
      vars = {
        card.ability.extra.debuff_mult,
        localize(card.ability.extra.suit, 'suits_plural'),
        card.ability.extra.mult,
        colours = { G.C.SUITS[card.ability.extra.suit] }
      }
    }
  end,

  update = function(self, card, dt)
    -- Update the mult this card gives by counting the amount of debuffed cards
    if G.playing_cards then
      local total = 0

      for k, v in ipairs(G.playing_cards) do
        if v.debuff then
          total = total + 1
        end
      end

      card.ability.extra.mult = math.max(0, total * card.ability.extra.debuff_mult)
    end
  end,

  calculate = function(self, card, context)
    if not context.blueprint and context.after and context.cardarea == G.jokers then
      -- Only update the suit if it's a different suit
      if G.GAME.paperback.last_scored_suit ~= card.ability.extra.suit then
        card.ability.extra.suit = G.GAME.paperback.last_scored_suit
        G.E_MANAGER:add_event(Event {
          func = function()
            -- Update the debuff of all playing cards when swapping suits
            for k, v in ipairs(G.playing_cards) do
              G.GAME.blind:debuff_card(v)
            end

            return true
          end
        })

        return {
          message = localize(card.ability.extra.suit, 'suits_plural'),
          colour = G.C.SUITS[card.ability.extra.suit]
        }
      end
    end

    if context.joker_main then
      return {
        mult = card.ability.extra.mult
      }
    end
  end,

  joker_display_def = function(JokerDisplay)
    return {
      text = {
        { text = "+" },
        { ref_table = "card.ability.extra", ref_value = "mult", retrigger_type = "mult" }
      },
      text_config = { colour = G.C.MULT },
    }
  end,
}

-- We hook into the vanilla function used to update the debuffed status of cards
local debuff_card_ref = Blind.debuff_card
function Blind.debuff_card(self, card, from_blind)
  local ret = debuff_card_ref(self, card, from_blind)

  if card.area ~= G.jokers then
    for k, v in ipairs(SMODS.find_card('j_paperback_jester_of_nihil')) do
      if card:is_suit(v.ability.extra.suit, true) then
        card:set_debuff(true)
        if card.debuff then card.debuffed_by_blind = true end
      end
    end
  end

  return ret
end
