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
    if args.type == 'paperback_obtain_egg' and args.egg_total >= 3 then
      return true
    end
  end,

  locked_loc_vars = function(self, info_queue, card)
    local other_name = localize('k_unknown')
    if G.P_CENTERS['j_egg'].unlocked then
      other_name = localize { type = 'name_text', set = 'Joker', key = 'j_egg' }
    end
    return {
      vars = {
        other_name, 5, G.PROFILES[G.SETTINGS.profile].career_stats.paperback_egg_taken or 0
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
    G.PROFILES[G.SETTINGS.profile].career_stats.paperback_egg_taken = (G.PROFILES[G.SETTINGS.profile].career_stats.paperback_egg_taken or 0) +
    1
    if G.PROFILES[G.SETTINGS.profile].career_stats.paperback_egg_taken >= 3 then
      check_for_unlock({ type = 'paperback_obtain_egg', egg_total = G.PROFILES[G.SETTINGS.profile].career_stats
      .paperback_egg_taken })
    end
  end
end
