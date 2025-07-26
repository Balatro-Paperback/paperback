SMODS.Joker {
  key = 'jestosterone',
  config = {
    extra = {
      checked_rank = 12,
      rank_to_turn_into = 'King'
    }
  },
  rarity = 1,
  cost = 5,
  pos = { x = 17, y = 1 },
  atlas = 'jokers_atlas',
  blueprint_compat = false,

  in_pool = function(self, args)
    return not next(SMODS.find_card('j_paperback_jestrogen'))
  end,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        localize("Queen", 'ranks'), localize(card.ability.extra.rank_to_turn_into, 'ranks'),
      }
    }
  end,

  calculate = function(self, card, context)
    if context.final_scoring_step and context.cardarea == G.jokers and not context.blueprint then
      local cracked_eggs = {}
      for _, v in ipairs(context.scoring_hand) do
        if v:get_id() == card.ability.extra.checked_rank then
          cracked_eggs[#cracked_eggs + 1] = v
        end
      end
      if #cracked_eggs > 0 then
        PB_UTIL.use_consumable_animation(nil, cracked_eggs, function()
          for _, v in ipairs(cracked_eggs) do
            assert(SMODS.change_base(v, nil, card.ability.extra.rank_to_turn_into))
          end
          return true
        end)
        return {
          message = localize('paperback_jestosterone_ex'),
          colour = G.C.BLUE
        }
      end
    end
  end
}
