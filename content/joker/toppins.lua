SMODS.Joker {
  key = 'toppins',
  attributes = {
    'joker',
    'mult',
    'food',
  },
  rarity = 1,
  pos = { x = 20, y = 11 },
  atlas = 'jokers_atlas',
  cost = 5,
  unlocked = false,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,
  config = { 
    extra = { 
    mult = 2, 
    mult_gain = 2,
    mult_base = 2,
    } 
  },
  pools = {
    Food = true
  },

  in_pool = function(self, pool)
    return G.GAME.paperback.num_food_jokers_obtained >= 5
  end,

  paperback_credit = {
    coder = { 'infinityplus' }
  },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.mult_base,
        card.ability.extra.mult_gain,
      }
    }
  end,

  locked_loc_vars = function(self, info_queue, card)
    return { vars = { 5 } }
  end,

  check_for_unlock = function(self, args)
    if args.type == 'hand' then
      return PB_UTIL.get_unique_suits(args.scoring_hand, nil, true) >= 5
    end
  end,

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      local mult = card.ability.extra.mult

      if not context.blueprint then
        SMODS.scale_card(card, {
          ref_table = card.ability.extra,
          ref_value = 'mult',
          scalar_value = 'mult_gain',
          no_message = true
        })
      end

      return {
        mult = mult,
        card = card
      }
    end
    if context.after and not context.blueprint then
      card.ability.extra.mult = card.ability.extra.mult_base
    end
  end
}

local add_to_deck_ref = Card.add_to_deck
function Card:add_to_deck(from_debuff)
  add_to_deck_ref(self, from_debuff)
  if self.ability.set == 'Joker' then
    if PB_UTIL.is_food(self) then
      G.GAME.paperback.num_food_jokers_obtained = G.GAME.paperback.num_food_jokers_obtained + 1
    end
  end
end

