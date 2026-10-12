SMODS.Joker {
  key = "blue_marble",
  config = {
    extra = {
      mult = 0,
      increment = 2,
    }
  },
  attributes = {
    'mult',
    'scaling',
    'planet',
    'consumable',
    'space'
  },
  rarity = 1,
  pos = { x = 11, y = 1 },
  atlas = "jokers_atlas",
  cost = 3,
  unlocked = false,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = false,
  paperback_credit = {
    coder = { 'thermo' }
  },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.increment,
        card.ability.extra.mult
      }
    }
  end,

  locked_loc_vars = function (self, info_queue, card)
    return {vars = {3, localize("Clubs", 'suits_singular')}}
  end,

  check_for_unlock = function (self, args)
    if args.type == 'paperback_suit_flushes' then
      if G.GAME.paperback.played_flushes['Clubs'] and G.GAME.paperback.played_flushes['Clubs'] >= 3 then
        return true
      end
    end
  end,

  calculate = function(self, card, context)
    if context.using_consumeable and context.consumeable.ability.set == "Planet" then
      SMODS.scale_card(card, {
        ref_table = card.ability.extra,
        ref_value = 'mult',
        scalar_value = 'increment'
      })
      return nil, true
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
      text_config = { colour = G.C.MULT }
    }
  end
}
