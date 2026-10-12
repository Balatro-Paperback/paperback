SMODS.Joker {
  key = "disco",
  blueprint_compat = true,
  rarity = 2,
  cost = 7,
  pos = { x = 20, y = 3 },
  atlas = "jokers_atlas",
  perishable_compat = false,
  config = { extra = { mult_mod = 2, dollars = 25, mult = 0 } },
  attributes = {
    'mult',
    'scaling'
  },
  paperback_credit = {
    artist = { 'thermo' },
    coder = { 'thermo' }
  },
  unlocked = false,

  locked_loc_vars = function (self, info_queue, card)
    return { vars = { 30 }}
  end,

  check_for_unlock = function(self, args)
    if args.type == 'win_no_hand' then
      return G.GAME.paperback.highest_amount_of_money_had <= 30
    end
  end,


  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.mult_mod, card.ability.extra.dollars, card.ability.extra.mult } }
  end,
  calculate = function(self, card, context)
    if not context.blueprint and context.buying_card and to_big(G.GAME.dollars) <= to_big(card.ability.extra.dollars) and context.card ~= card then
      SMODS.scale_card(card, {
        ref_table = card.ability.extra,
        ref_value = 'mult',
        scalar_value = 'mult_mod'
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
      text_config = { colour = G.C.MULT },
    }
  end,
}
