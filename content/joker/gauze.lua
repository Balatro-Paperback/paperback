SMODS.Joker {
  key = 'gauze',
  config = {
    extra = {
      enhancement = 'm_paperback_bandaged',
    }
  },
  rarity = 1,
  pos = { x = 21, y = 5 },
  atlas = 'jokers_atlas',
  cost = 4,
  unlocked = true,
  discovered = false,
  blueprint_compat = false,
  eternal_compat = true,
  perishable_compat = true,
  enhancement_gate = 'm_paperback_bandaged',
  paperback = {
    requires_enhancements = true
  },

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.extra.enhancement]

    return {
      vars = { localize {
        type = 'name_text',
        set = 'Enhanced',
        key = card.ability.extra.enhancement
      } }
    }
  end,

  calculate = function(self, card, context)
    if context.pre_discard and G.GAME.current_round.discards_left == 1 and #context.full_hand == 1 then
      PB_UTIL.use_consumable_animation(card, G.hand.highlighted, function()
        for _, v in ipairs(G.hand.highlighted) do
          v:set_ability(G.P_CENTERS[card.ability.extra.enhancement])
        end
      end)
    end
  end,
}
