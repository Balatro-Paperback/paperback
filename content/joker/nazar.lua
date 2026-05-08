SMODS.Joker {
  key = "nazar",
  config = {
    extra = {
      chips = 0,
      chips_gain = 8,
    },
  },
  attributes = {
    'chips',
    'scaling',
    'tarot',
    'minor_arcana'
  },
  rarity = 1,
  pos = { x = 22, y = 7 },
  atlas = "jokers_atlas",
  cost = 5,
  unlocked = false,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = false,
  soul_pos = nil,
  paperback = {
    requires_minor_arcana = true
  },

  paperback_credit = {
    coder = { 'vitellary' },
  },

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.chips_gain, card.ability.extra.chips } }
  end,

  check_for_unlock = function(self, args)
    if args.type == 'discover_amount' and (G.DISCOVER_TALLIES['paperback_minor_arcanas'] ~= nil) then
      return (G.DISCOVER_TALLIES['tarots'].tally >= G.DISCOVER_TALLIES['tarots'].of) and
          (G.DISCOVER_TALLIES['paperback_minor_arcanas'].tally >= G.DISCOVER_TALLIES['paperback_minor_arcanas'].of)
    end
  end,

  calculate = function(self, card, context)
    if context.using_consumeable and not context.blueprint and (context.consumeable.ability.set == 'Tarot' or context.consumeable.ability.set == 'paperback_minor_arcana') then
      SMODS.scale_card(card, {
        ref_table = card.ability.extra,
        ref_value = 'chips',
        scalar_value = 'chips_gain',
        message_colour = G.C.CHIPS
      })
      return nil, true
    end
    if context.joker_main then
      return {
        chips = card.ability.extra.chips
      }
    end
  end
}
