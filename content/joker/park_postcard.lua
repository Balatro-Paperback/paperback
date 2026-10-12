SMODS.Joker {
  key = "park_postcard",
  config = {
    extra = {
      change = 0.2,
      xm = 1
    }
  },
  attributes = {
    'xmult',
    'scaling',
    'reset'
  },
  paperback_credit = {
    coder = { 'thermo' }
  },
  rarity = 3,
  pos = { x = 9, y = 11 },
  atlas = "jokers_atlas",
  cost = 8,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = false,
  unlocked = false,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.change, card.ability.extra.xm
      }
    }
  end,

  check_for_unlock = function (self, args)
    if args.type == 'win' then
      return G.GAME.paperback.cards_added_to_deck == 0 and G.GAME.paperback.destroyed_cards["cards"] == 0
    end
  end,

  calculate = function(self, card, context)
    if context.joker_main and card.ability.extra.xm > 1 then
      return {
        xmult = card.ability.extra.xm
      }
    end
    if context.end_of_round and context.main_eval and not context.blueprint then
      SMODS.scale_card(card, {
        ref_table = card.ability.extra,
        ref_value = 'xm',
        scalar_value = 'change',
        message_key = 'a_xmult',
        message_colour = G.C.MULT
      })
      return nil, true
    end
    if context.playing_card_added or context.remove_playing_cards and not context.blueprint then
      SMODS.reset_card(card, {
        ref_table = card.ability.extra,
        ref_value = 'xm',
        reset_value = 1
      })
      return nil, true
    end
  end
}
