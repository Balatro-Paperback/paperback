SMODS.Joker {
  key = 'plastic_wrap',
  config = {
    extra = {
      amount = 2,
      enhancement = 'm_paperback_sleeved'
    }
  },
  rarity = 1,
  pos = { x = 21, y = 4 },
  atlas = 'jokers_atlas',
  cost = 4,
  unlocked = true,
  discovered = false,
  blueprint_compat = false,
  eternal_compat = true,
  perishable_compat = true,
  enhancement_gate = 'm_paperback_sleeved',
  paperback = {
    requires_enhancements = true
  },

  paperback_credit = {
    coder = { 'vitellary' }
  },

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.amount, localize { type = 'name_text', set = 'Enhanced', key = card.ability.extra.enhancement }, } }
  end,

  calculate = function(self, card, context)
    if context.remove_playing_cards then
      local enhanced = false
      for _, removed in ipairs(context.removed) do
        if SMODS.has_enhancement(removed, card.ability.extra.enhancement) then
          local targets = {}
          for _, other in ipairs(G.playing_cards) do
            if other.ability.set ~= "Enhanced" then
              targets[#targets + 1] = other
            end
          end
          for i = 1, math.min(#targets, card.ability.extra.amount) do
            local target = table.remove(targets, pseudorandom('plastic_wrap', 1, #targets))
            enhanced = true
            target:set_ability(card.ability.extra.enhancement, nil, true)
            if target.area == G.hand then
              G.E_MANAGER:add_event(Event({
                func = function()
                  target:juice_up()
                  return true
                end
              }))
            end
          end
        end
      end
      if enhanced then
        return {
          message = localize('paperback_enhanced_ex'),
        }
      end
    end
  end,
}
