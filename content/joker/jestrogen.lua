SMODS.Joker {
  key = 'jestrogen',
  config = {
    extra = {
      checked_rank1 = 11,
      checked_rank2 = 13,
      rank_to_turn_into = "Queen",
      cracked_eggs = {}
    }
  },
  rarity = 1,
  cost = 5,
  pos = { x = 17, y = 0 },
  atlas = 'jokers_atlas',
  unlocked = true,
  discovered = false,
  blueprint_compat = false,

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      card.ability.extra.cracked_eggs = {}
      for _, v in ipairs(context.scoring_hand) do
        if (v:get_id() == card.ability.extra.checked_rank1) or (v:get_id() == card.ability.extra.checked_rank2) then
          card.ability.extra.cracked_eggs[#card.ability.extra.cracked_eggs + 1] = v
        end
      end
    end

    if context.final_scoring_step and context.cardarea == G.jokers and not context.blueprint then
      for i = 1, #card.ability.extra.cracked_eggs do
        local percent = 1.15 - (i - 0.999) / (#card.ability.extra.cracked_eggs - 0.998) * 0.3
        G.E_MANAGER:add_event(Event({
          trigger = 'after',
          delay = 0.15,
          func = function()
            card.ability.extra.cracked_eggs[i]:flip()
            play_sound('card1', percent)
            card.ability.extra.cracked_eggs[i]:juice_up(0.3, 0.3)
            return true
          end
        }))
      end

      delay(0.2)

      for i = 1, #card.ability.extra.cracked_eggs do
        G.E_MANAGER:add_event(Event({
          trigger = 'after',
          delay = 0.1,
          func = function()
            assert(SMODS.change_base(card.ability.extra.cracked_eggs[i], nil, card.ability.extra.rank_to_turn_into))
            return true
          end
        }))
      end


      for i = 1, #card.ability.extra.cracked_eggs do
        local percent = 0.85 + (i - 0.999) / (#card.ability.extra.cracked_eggs - 0.998) * 0.3
        G.E_MANAGER:add_event(Event({
          trigger = 'after',
          delay = 0.15,
          func = function()
            card.ability.extra.cracked_eggs[i]:flip()
            play_sound('tarot2', percent, 0.6)
            card.ability.extra.cracked_eggs[i]:juice_up(0.3, 0.3)
            return true
          end
        }))
      end

      if #card.ability.extra.cracked_eggs > 0 then
        return {
          message = localize('paperback_jestrogen_ex'),
          colour = G.C.RED
        }
      end
    end
  end
}
