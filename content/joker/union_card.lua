SMODS.Joker {
  key = 'union_card',
  rarity = 3,
  pos = { x = 8, y = 1 },
  atlas = "jokers_atlas",
  cost = 8,
  unlocked = true,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,
  soul_pos = nil,

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = PB_UTIL.suit_tooltip('light')
  end,

  add_to_deck = function(self, card, from_debuff)
    -- Set the sell cost of all jokers and consumables to 0
    card.sell_cost = 0

    for _, v in ipairs(G.jokers.cards) do
      v.sell_cost = 0
    end

    for _, v in ipairs(G.consumeables.cards) do
      v.sell_cost = 0
    end
  end,

  remove_from_deck = function(self, card, from_debuff)
    -- Make the game recalculate the sell cost of all jokers and consumables
    for _, v in ipairs(G.jokers.cards) do
      if v.set_cost then
        v:set_cost()
      end
    end

    for _, v in ipairs(G.consumeables.cards) do
      if v.set_cost then
        v:set_cost()
      end
    end
  end,

  calculate = function(self, card, context)
    if context.cardarea == G.jokers and context.joker_main then
      local suitable_cards = 0

      for _, v in ipairs(context.scoring_hand) do
        if PB_UTIL.is_suit(v, 'light') then
          suitable_cards = suitable_cards + 1
        end
      end

      if suitable_cards > 1 then
        return {
          x_mult = suitable_cards,
          card = card
        }
      end
    end
  end,

  joker_display_def = function(JokerDisplay)
    return {
      text = {
        {
          border_nodes = {
            { text = "X" },
            { ref_table = "card.joker_display_values", ref_value = "x_mult", retrigger_type = "exp" }
          }
        }
      },
      reminder_text = {
        { text = "(" },
        {
          text = localize('paperback_light'),
          colour = lighten(G.C.PAPERBACK_LIGHT_SUIT, 0.35)
        },
        { text = ")" },
      },
      calc_function = function(card)
        local count = 0
        local _, _, scoring_hand = JokerDisplay.evaluate_hand()
        for _, scoring_card in pairs(scoring_hand) do
          if PB_UTIL.is_suit(scoring_card, 'light') then
            count = count + 1
          end
        end
        card.joker_display_values.x_mult = math.max(count, 1)
      end,
    }
  end,
}

-- If user has Union Card, set the newly acquired card's sell cost to $0
local add_to_deck_ref = Card.add_to_deck
Card.add_to_deck = function(self, from_debuff)
  local ret = add_to_deck_ref(self, from_debuff)

  if next(SMODS.find_card("j_paperback_union_card")) then
    self.sell_cost = 0
  end

  return ret
end

-- When calculating the sell cost for a card, if Union Card is present then override it
-- and set the sell cost to 0
local set_cost_ref = Card.set_cost
function Card.set_cost(self)
  local ret = set_cost_ref(self)
  if self.added_to_deck then
    -- If this card is Union Card set sell cost to 0
    if self.config.center.key == "j_paperback_union_card" then
      self.sell_cost = 0
    end

    -- If Union Card is added to deck set sell cost to 0
    if next(SMODS.find_card("j_paperback_union_card")) then
      self.sell_cost = 0
    end
  end

  return ret
end
