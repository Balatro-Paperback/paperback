SMODS.Joker {
  key = "keycard",
  config = {
    extra = {
      dollars = 25
    }
  },
  attributes = {
    'economy'
  },
  paperback_credit = {
    coder = { 'thermo' }
  },
  rarity = 2,
  pos = { x = 6, y = 11 },
  atlas = "jokers_atlas",
  cost = 5,
  blueprint_compat = false,
  eternal_compat = false,
  perishable_compat = true,
  unlocked = false,

  locked_loc_vars = function (self, info_queue, card)
    return { vars = { localize { type = 'name_text', set = 'Tag', key = 'tag_investment' } } }
  end,

  check_for_unlock = function (self, args)
    return args.type == "paperback_use_investment_tag"
  end,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.dollars
      }
    }
  end,

  calculate = function(self, card, context)
    if context.end_of_round and context.beat_boss and context.main_eval and not context.blueprint then
      card.ability.extra.active = true
      return {
        message = localize('k_active_ex')
      }
    end

    if context.paperback and context.paperback.cashing_out and card.ability.extra.active and not context.blueprint then
      PB_UTIL.destroy_joker(card)
      return {
        dollars = card.ability.extra.dollars,
      }
    end
  end
}