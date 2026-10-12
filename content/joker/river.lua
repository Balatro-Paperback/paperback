SMODS.Joker {
  key = "river",
  config = {
    extra = {
      money_cap = 11
    }
  },
  attributes = {
    'economy'
  },
  rarity = 2,
  pos = { x = 4, y = 4 },
  atlas = "jokers_atlas",
  cost = 7,
  unlocked = false,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,
  soul_pos = nil,

  paperback_credit = {
    coder = { 'oppositewolf' }
  },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.money_cap
      }
    }
  end,

  locked_loc_vars = function(self, info_queue, card)
    return {
      vars = {
        5
      }
    }
  end,

  check_for_unlock = function (self, args)
    if args.type == 'paperback_five_rounds_no_discards' then
      return true
    end
  end,

  calculate = function(self, card, context)
    if context.before and context.main_eval then
      -- Check if the scoring_hand contains five cards
      if #context.scoring_hand >= 5 then
        local lowest_chip_cards = { context.scoring_hand[1] }
        local lowest_chip_bonus = context.scoring_hand[1]:get_chip_bonus()

        -- Find the lowest card in the scoring_hand
        for i, current_card in ipairs(context.scoring_hand) do
          if i ~= 1 then
            local current_chip_bonus = current_card:get_chip_bonus()
            if current_chip_bonus < lowest_chip_bonus then
              lowest_chip_cards = { current_card }
              lowest_chip_bonus = current_chip_bonus
            elseif current_chip_bonus == lowest_chip_bonus then
              table.insert(lowest_chip_cards, current_card)
            end
          end
        end

        -- Do not give money if all lowest cards are debuffed
        local all_debuffed = true
        for _, c in ipairs(lowest_chip_cards) do
          if not c.debuff then
            all_debuffed = false; break
          end
        end
        if all_debuffed then
          return {
            message = localize('k_debuffed'),
            colour = G.C.MULT,
            card = card
          }
        end

        local half_chip_value = math.ceil(lowest_chip_bonus / 2)

        -- Calculate the money to give and return it
        local money_to_give = half_chip_value > card.ability.extra.money_cap
            and card.ability.extra.money_cap or half_chip_value
        ease_dollars(money_to_give)

        return {
          message = localize("$") .. money_to_give,
          colour = G.C.MONEY,
          delay = 0.45,
          card = card
        }
      end
    end
  end
}
