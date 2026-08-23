SMODS.Joker {
  key = "kintsugi_joker",
  config = {
    extra = {
      increase = 2,
      total = 0,
      enhancement = 'm_paperback_ceramic'
    }
  },
  attributes = {
    'economy',
    'enhancements'
  },
  rarity = 2,
  pos = { x = 8, y = 9 },
  atlas = "jokers_atlas",
  cost = 7,
  unlocked = false,
  discovered = false,
  blueprint_compat = false,
  eternal_compat = true,
  perishable_compat = false,
  paperback = {
    requires_enhancements = true
  },
  enhancement_gate = 'm_paperback_ceramic',

  paperback_credit = {
    coder = { 'srockw' },
  },

  check_for_unlock = function (self, args)
    return (G.GAME.paperback.destroyed_cards.enhancements["m_paperback_ceramic"] or 0) >= 5
  end,

  locked_loc_vars = function (self, info_queue, card)
    return { vars = { 5 }}
  end,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.increase,
        localize {
          type = 'name_text',
          set = 'Enhanced',
          key = card.ability.extra.enhancement
        },
        card.ability.extra.total
      }
    }
  end,

  add_to_deck = function(self, card, from_debuff)
    G.GAME.paperback.ceramic_inc = G.GAME.paperback.ceramic_inc + card.ability.extra.total
  end,

  remove_from_deck = function(self, card, from_debuff)
    G.GAME.paperback.ceramic_inc = G.GAME.paperback.ceramic_inc - card.ability.extra.total
  end,

  calculate = function(self, card, context)
    if not context.blueprint and context.remove_playing_cards then
      local inc = 0

      for _, v in ipairs(context.removed) do
        if SMODS.has_enhancement(v, card.ability.extra.enhancement) then
          inc = inc + 1
        end
      end

      if inc > 0 then
        SMODS.scale_card(card, {
          ref_table = card.ability.extra,
          ref_value = 'total',
          scalar_value = 'increase',
          operation = function(ref_table, ref_value, initial, scaling)
            ref_table[ref_value] = initial + scaling * inc
            G.GAME.paperback.ceramic_inc = G.GAME.paperback.ceramic_inc + scaling * inc
          end
        })
        return nil, true
      end
    end
  end
}
