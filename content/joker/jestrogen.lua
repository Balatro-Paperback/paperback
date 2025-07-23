SMODS.Joker {
  key = 'jestrogen',
  config = {
    extra = {
      checked_rank1 = 11,
      checked_rank2 = 13,
      rank_to_turn_into = "Queen",
    }
  },
  rarity = 1,
  cost = 5,
  pos = { x = 17, y = 0 },
  atlas = 'jokers_atlas',
  blueprint_compat = false,

  in_pool = function(self, args)
    return not next(SMODS.find_card('j_paperback_jestosterone'))
  end,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        localize("King", 'ranks'), localize("Jack", 'ranks'), localize(card.ability.extra.rank_to_turn_into, 'ranks'),
      }
    }
  end,
  calculate = function(self, card, context)
    if context.final_scoring_step and context.cardarea == G.jokers and not context.blueprint then
      local cracked_eggs = {}
      for _, v in ipairs(context.scoring_hand) do
        if (v:get_id() == card.ability.extra.checked_rank1 or v:get_id() == card.ability.extra.checked_rank2) then
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
          message = localize('paperback_jestrogen_ex'),
          colour = G.C.RED
        }
      end
    end
  end
}
