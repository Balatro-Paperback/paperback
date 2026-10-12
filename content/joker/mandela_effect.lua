SMODS.Joker {
  key = 'mandela_effect',
  attributes = {
    'modify_card',
    'enhancements',
    'face',
  },
  rarity = 1,
  pos = { x = 20, y = 8 },
  atlas = 'jokers_atlas',
  cost = 4,
  unlocked = false,
  discovered = false,
  blueprint_compat = false,
  eternal_compat = true,
  paperback_credit = {
    artist = { 'dylan_hall' },
    coder = { ' ejwu' }
  },

  check_for_unlock = function(self, args)
    if args.type == 'hand' then
      for _, v in ipairs(args.scoring_hand) do
        if PB_UTIL.is_rank(v, 'King') and v.base.suit == ('Spades') then
          for _, w in ipairs(args.scoring_hand) do
            if PB_UTIL.is_rank(w, 'Jack') and w.base.suit == ('Spades') then
              return true
            end
          end
        end
      end
    end
  end,

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
          options = PB_UTIL.get_ranked_enhancements(),
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
