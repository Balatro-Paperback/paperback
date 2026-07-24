SMODS.Joker {
  key = "arayashiki",
  config = {
    extra = {
      odds = 2,
      ma_card = "c_paperback_nine_of_swords"
    }
  },
  attributes = {
    'red',
    'ego_gift',
    'generation',
    'minor_arcana'
  },
  rarity = 2,
  pos = { x = 1, y = 13 },
  atlas = "jokers_atlas",
  cost = 8,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,
  paperback = {
    requires_minor_arcana = true,
    requires_ego_gifts = true
  },
  paperback_credit = {
    coder = { 'thermo' }
  },

  in_pool = function(self, args)
    for _, v in ipairs(G.consumeables.cards or {}) do
      if PB_UTIL.is_ego_gift(v) then return true end
    end
  end,

  loc_vars = function(self, info_queue, card)
    local numerator, denominator = PB_UTIL.chance_vars(card)
    return {
      vars = {
        numerator,
        denominator,
        localize {
          type = 'name_text',
          set = 'paperback_minor_arcana',
          key = card.ability.extra.ma_card
        }
      }
    }
  end,

  calculate = function(self, card, context)
    if context.end_of_round and context.main_eval then
      local scoring_ego
      if next(SMODS.find_card("c_paperback_nine_of_swords")) then
        for _, v in ipairs(G.consumeables.cards or {}) do
          if v.center.key == "c_paperback_nine_of_swords" and v.edition and v.edition.negative then
            return nil, true
          end
        end
      end
      for _, v in ipairs(G.consumeables.cards or {}) do
        if not scoring_ego and PB_UTIL.is_ego_gift(v) and PB_UTIL.chance(card, "arayashiki") then
          scoring_ego = v
          break
        end
      end
      if not scoring_ego then return nil, true end
      G.E_MANAGER:add_event(Event({
        func = function()
          local new_card = SMODS.add_card {
            set = 'paperback_minor_arcana',
            key = 'c_paperback_nine_of_swords',
            key_append = 'paperback_arayashiki',
            edition = 'e_negative'
          }
          PB_UTIL.set_sell_value(new_card, 1)
          return true
        end
      }))
      return {
        colour = G.C.PAPERBACK_MINOR_ARCANA,
        message = localize('paperback_plus_minor_arcana'),
        message_card = scoring_ego
      }
    end
  end
}
