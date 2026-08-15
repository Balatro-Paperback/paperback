SMODS.Joker {
  key = "buckshot",
  config = {
    extra = {
      dollars = 3,
      poker_hand = "Two Pair"
    }
  },
  attributes = {
    'hand_type',
    'pair',
    'destroy_cards',
    'economy'
  },
  rarity = 2,
  pos = { x = 2, y = 12 },
  atlas = "jokers_atlas",
  cost = 6,
  blueprint_compat = false,
  eternal_compat = true,
  perishable_compat = true,
  paperback_credit = {
    coder = { 'thermo' }
  },
  unlocked = false,

  locked_loc_vars = function(self, info_queue, card)
    return { vars = { localize('Two Pair', 'poker_hands') } }
  end,
  check_for_unlock = function(self, args)
    if args.type == 'win' then
      return PB_UTIL.get_most_played_hands()[1].key == 'Two Pair'
    end
  end,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.dollars
      }
    }
  end,

  calculate = function(self, card, context)
    if context.after and not context.blueprint_card and next(context.poker_hands[card.ability.extra.poker_hand]) then
      -- collect pairs
      local sorted_hand = {}
      for _, c in ipairs(context.scoring_hand) do
        if SMODS.has_no_rank(c) then goto continue end
        local rank = c.base.id
        if sorted_hand[rank] then
          table.insert(sorted_hand[rank], c)
          goto continue
        end
        sorted_hand[rank] = { c }
        ::continue::
      end

      local kill = pseudorandom_element(sorted_hand, "buckshot")
      local count = #kill
      SMODS.destroy_cards(kill)
      return {
        dollars = count * card.ability.extra.dollars
      }
    end
  end
}
