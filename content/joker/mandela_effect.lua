SMODS.Joker {
  key = 'mandela_effect',
  rarity = 1,
  pos = { x = 20, y = 8 },
  atlas = 'jokers_atlas',
  cost = 4,
  unlocked = true,
  discovered = false,
  blueprint_compat = false,
  eternal_compat = true,

  calculate = function(self, card, context)
    if context.before and not context.blueprint then
      -- find index of first scoring face
      local idx
      for i, c in ipairs(context.scoring_hand) do
        if c:is_face(true) then
          idx = i
          break
        end
      end
      if not idx then return end

      local first_face = context.scoring_hand[idx]
      if not first_face.debuff then
        local enhancement = SMODS.poll_enhancement {
          key = 'mandela_effect_enh',
          guaranteed = true
        }
        first_face:set_ability(enhancement, nil, true)
        G.E_MANAGER:add_event(Event({
          func = function()
            first_face:juice_up()
            return true
          end
        }))
        return {
          message = localize('paperback_enhanced_ex'),
        }
      end
    end
  end,
}
