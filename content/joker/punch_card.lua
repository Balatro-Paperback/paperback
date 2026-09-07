SMODS.Joker {
  key = "punch_card",
  config = {
    extra = {
      current_rounds = 0,
      total_rounds = 3,
      antes = -1
    }
  },
  attributes = {
    'ante',
    'on_sell'
  },
  rarity = 3,
  pos = { x = 15, y = 3 },
  atlas = "jokers_atlas",
  cost = 10,
  blueprint_compat = false,
  eternal_compat = false,
  unlocked = false,

  paperback_credit = {
    coder = { 'oppositewolf' }
  },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.total_rounds, card.ability.extra.current_rounds, card.ability.extra.antes
      }
    }
  end,

  check_for_unlock = function(self, args)
    return args.type == 'paperback_ice_cream_taken' and args.total >= 3
  end,

  locked_loc_vars = function(self, info_queue, card)
    local other_name = localize('k_unknown')
    if G.P_CENTERS['j_ice_cream'].unlocked then
      other_name = localize { type = 'name_text', set = 'Joker', key = 'j_ice_cream' }
    end
    return {
      vars = {
        other_name, 3, PB_UTIL.get_career_stat("ice_cream_taken", 0)
      }
    }
  end,

  calculate = function(self, card, context)
    if context.selling_self and (card.ability.extra.current_rounds >= card.ability.extra.total_rounds) and not context.blueprint then
      ease_ante(card.ability.extra.antes)
      return { message = localize('paperback_punch_card_ex'), colour = G.C.RED }
    end

    if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
      card.ability.extra.current_rounds = card.ability.extra.current_rounds + 1
      if card.ability.extra.current_rounds == card.ability.extra.total_rounds then
        local eval = function(card) return not card.REMOVED end
        juice_card_until(card, eval, true)
      end
      return {
        message = (card.ability.extra.current_rounds < card.ability.extra.total_rounds) and
            (card.ability.extra.current_rounds .. '/' .. card.ability.extra.total_rounds) or
            localize('paperback_punch_card_active'),
        colour = G.C.BLUE
      }
    end
  end
}

local add_to_deck_ref = Card.add_to_deck
function Card:add_to_deck(from_debuff)
  add_to_deck_ref(self, from_debuff)
  if self.ability.set == 'Joker' and self.config.center.key == 'j_ice_cream' then
    PB_UTIL.increment_career_stat("ice_cream_taken")
  end
end