SMODS.Joker {
  key = "you_are_a_fool",
  config = {
    extra = {
      faces = 3
    }
  },
  attributes = {
    'modify_card',
    'face'
  },
  rarity = 3,
  pos = { x = 9, y = 6 },
  atlas = "jokers_atlas",
  cost = 8,
  unlocked = false,
  discovered = false,
  blueprint_compat = false,
  eternal_compat = false,
  perishable_compat = true,

  paperback_credit = {
    coder = { 'srockw' }
  },

  check_for_unlock = function(self, args)
    if args.type == 'modify_deck' and next(G.playing_cards) then
      for k, v in pairs(G.playing_cards) do
        if not v:is_face() then return false end
      end
      return true
    end
  end,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.faces
      }
    }
  end,

  calculate = function(self, card, context)
    if not context.blueprint and context.after and context.main_eval then
      local faces = 0

      for _, v in ipairs(context.scoring_hand) do
        if v:is_face() then
          faces = faces + 1
        end
      end

      if faces >= card.ability.extra.faces then
        local left = context.scoring_hand[1]

        PB_UTIL.use_consumable_animation(nil, G.hand.cards, function()
          for _, v in ipairs(G.hand.cards) do
            copy_card(left, v)
          end
        end)

        PB_UTIL.destroy_joker(card)

        return {
          message = localize('paperback_destroyed_ex'),
          colour = G.C.MULT
        }
      end
    end
  end
}
