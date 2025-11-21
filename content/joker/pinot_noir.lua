SMODS.Joker {
  key = "pinot_noir",
  config = {
    extra = {
      remaining = 10,
      extra_mult = 1
    }
  },
  rarity = 1,
  pos = { x = 18, y = 1 },
  atlas = "jokers_atlas",
  cost = 5,
  blueprint_compat = false,
  eternal_compat = false,
  perishable_compat = true,
  enhancement_gate = 'm_paperback_stained',
  pools = {
    Food = true
  },
  paperback = {
    requires_enhancements = true
  },

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.m_paperback_stained

    return {
      vars = {
        card.ability.extra.remaining,
        localize {
          type = 'name_text',
          set = 'Enhanced',
          key = 'm_paperback_stained'
        },
        card.ability.extra.extra_mult
      }
    }
  end,

  add_to_deck = function(self, card, from_debuff)
    if card.ability.extra.remaining > 0 then
      G.GAME.paperback.stained_inc = G.GAME.paperback.stained_inc + card.ability.extra.extra_mult
    end
  end,

  remove_from_deck = function(self, card, from_debuff)
    if card.ability.extra.remaining >= 0 then
      G.GAME.paperback.stained_inc = G.GAME.paperback.stained_inc - card.ability.extra.extra_mult
    end
  end,

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.hand and not context.blueprint
    and not context.end_of_round then
      if SMODS.has_enhancement(context.other_card, 'm_paperback_stained') and card.ability.extra.remaining > 0 then
        card.ability.extra.remaining = card.ability.extra.remaining - 1

        if card.ability.extra.remaining < 1 then
          PB_UTIL.destroy_joker(card)

          return {
            message = localize('paperback_consumed_ex'),
            colour = G.C.MULT
          }
        end
      end
    end
  end
}
