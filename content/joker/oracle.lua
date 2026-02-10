SMODS.Joker {
  key = "oracle",
  config = {
    extra = {
      Xchip_mod = 0.1,
      Xchip = 1
    }
  },
  rarity = 2,
  pos = { x = 15, y = 9 },
  atlas = 'jokers_atlas',
  cost = 6,
  unlocked = true,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,
  paperback = {
    requires_minor_arcana = true
  },

  paperback_credit = {
    coder = { 'dowfrin' }
  },

  loc_vars = function(self, info_queue, card)
    card.ability.extra.Xchip = 1 + (PB_UTIL.count_used_consumables("paperback_minor_arcana", false))
        * card.ability.extra.Xchip_mod
    return {
      vars = {
        card.ability.extra.Xchip_mod,
        card.ability.extra.Xchip,
        localize('k_paperback_minor_arcana')
      }
    }
  end,

  calculate = function(self, card, context)
    card.ability.extra.Xchip = 1 + (PB_UTIL.count_used_consumables("paperback_minor_arcana", false))
        * card.ability.extra.Xchip_mod

    if context.joker_main then
      return {
        x_chips = card.ability.extra.Xchip,
      }
    end

    if not context.blueprint and context.using_consumeable and context.consumeable.ability.set == 'paperback_minor_arcana' and G.GAME.consumeable_usage[context.consumeable.config.center_key].count == 1 then
      return {
        message = localize {
          type = 'variable',
          key = 'a_xchips',
          vars = { card.ability.extra.Xchip }
        },
      }
    end
  end,

  joker_display_def = function(JokerDisplay)
    return {
      text = {
        {
          border_nodes = {
            { text = 'X' },
            { ref_table = 'card.ability.extra', ref_value = 'Xchip' }
          },
          border_colour = G.C.CHIPS
        }
      },
    }
  end
}
