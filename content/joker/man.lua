SMODS.Joker {
  key = "man",
  config = {
    extra = {
      perma_mult = 1
    }
  },
  attributes = {
    'red',
    'perma_bonus',
    'modify_card',
    'mult',
    'suit',
    'dark'
  },
  rarity = 2,
  pos = { x = 6, y = 13 },
  atlas = "jokers_atlas",
  cost = 7,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,
  unlocked = false,
  paperback = {

  },
  paperback_credit = {
    coder = { 'thermo' }
  },

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = PB_UTIL.suit_tooltip('dark')
    return {
      vars = {
        card.ability.extra.perma_mult
      }
    }
  end,

  check_for_unlock = function(self, args)
    return args.type == 'paperback_egg_taken' and args.total >= 5
  end,

  locked_loc_vars = function(self, info_queue, card)
    local other_name = localize('k_unknown')
    if G.P_CENTERS['j_egg'].unlocked then
      other_name = localize { type = 'name_text', set = 'Joker', key = 'j_egg' }
    end
    return {
      vars = {
        other_name, 5, PB_UTIL.get_career_stat("egg_taken", 0)
      }
    }
  end,

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play and context.other_card:is_suit_shade('dark') then
      context.other_card.ability.perma_mult = (
        context.other_card.ability.perma_mult or 0
      ) + card.ability.extra.perma_mult
      return {
        message = localize('k_upgrade_ex'),
        colour = G.C.MULT
      }
    end
  end
}

local add_to_deck_ref = Card.add_to_deck
function Card:add_to_deck(from_debuff)
  add_to_deck_ref(self, from_debuff)
  if self.ability.set == 'Joker' and self.config.center.key == 'j_egg' then
    PB_UTIL.increment_career_stat("egg_taken")
  end
end
