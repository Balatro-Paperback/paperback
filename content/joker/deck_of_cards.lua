SMODS.Joker {
  key = "deck_of_cards",
  rarity = 2,
  config = {
    extra = {
      Xchips_mod = 0.25,
      x_chips = 1,
      enhancement = 'm_paperback_antique',
      active = false
    }
  },
  pos = { x = 21, y = 1 },
  atlas = 'jokers_atlas',
  cost = 7,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = false,
  paperback = {
    requires_enhancements = true
  },

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.extra.enhancement]

    return {
      vars = {
        localize {
          type = 'name_text',
          set = 'Enhanced',
          key = card.ability.extra.enhancement
        },
        card.ability.extra.Xchips_mod,
        card.ability.extra.x_chips
      }
    }
  end,

  enhancement_gate = 'm_paperback_antique',

  calculate = function(self, card, context)
    if not context.blueprint and context.before and #context.full_hand == 1 then
      if SMODS.has_enhancement(context.scoring_hand[1], card.ability.extra.enhancement) then
        card.ability.extra.x_chips = card.ability.extra.x_chips + card.ability.extra.Xchips_mod
        card.ability.extra.active = true

        return {
          message = localize('k_upgrade_ex'),
        }
      end
    end

    if context.destroy_card and card.ability.extra.active and not context.blueprint then
      card.ability.extra.active = false
      return {
        remove = true
      }
    end

    if context.joker_main then
      return {
        x_chips = card.ability.extra.x_chips,
      }
    end
  end,

  joker_display_def = function(JokerDisplay)
    return {
      text = {
        {
          border_nodes = {
            { text = "X" },
            { ref_table = "card.ability.extra", ref_value = "x_chips", retrigger_type = "exp" }
          }
        }
      },
    }
  end,
}
