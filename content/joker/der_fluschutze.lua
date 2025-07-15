SMODS.Joker{
  key = "der_fluschutze",
  rarity = 3,
  config = {
    extra = {
      Xmult_mod = 0.25,
      x_mult = 1
    }
  },
  pos = {x = 14, y = 5},
  atlas = 'jokers_atlas',
  cost = 9,
  unlocked = true,
  discovered = true,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,
  soul_pos = nil,
  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.Xmult_mod,
        card.ability.extra.x_mult
      }
    }
  end,

  calculate = function(self, card, context)
    --Destroy a face card and increase mult counter
    if not context.blueprint and context.destroying_card and #context.full_hand == 1 then
        if context.destroying_card:is_face(true) and G.GAME.current_round.hands_played == 0 then
            local ret = {
              remove = true,
              focus = card
            }
            card.ability.extra.x_mult = card.ability.extra.x_mult + card.ability.extra.Xmult_mod
            ret.message = localize('k_upgrade_ex')
          return ret
        end
  
    end
  --Play Xmult at end of hand
  if context.joker_main then
      return {
        x_mult = card.ability.extra.x_mult,
        card = card
      }
    end
  end
}
--[[
local card = create_card('Joker', G.jokers, nil, nil, nil, nil, 'j_paperback_der_fluschutze', 'deck') 
  card:add_to_deck()
  G.jokers:emplace(card)
local card = create_card('Joker', G.jokers, nil, nil, nil, nil, 'j_blueprint', 'deck') 
  card:add_to_deck()
  G.jokers:emplace(card)
]]