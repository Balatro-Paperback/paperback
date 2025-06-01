SMODS.Joker {
  key = "as_above_so_below",
  config = {
    extra = {
      odds = 5,
      enhancement = 'm_paperback_apostle'
    }
  },
  rarity = 2,
  pos = { x = 0, y = 0 }, -- CHANGE WHEN SPRITE IS ADDED TO ATLAS
  atlas = "jokers_atlas",
  cost = 6,
  unlocked = true,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,
  paperback = {
    requires_enhancements = true,
  },
  enhancement_gate = 'm_paperback_apostle',

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        localize {
          type = 'name_text',
          set = 'Enhanced',
          key = card.ability.extra.enhancement
        },
      }
    }
  end,

  calculate = function(self, card, context)
    if context.before then
      local apostle = false
      -- Check for apostle
      for _, v in ipairs(context.scoring_hand) do
        if SMODS.has_enhancement(v, card.ability.extra.enhancement) then
          apostle = true
          break
        end
      end
      if apostle and #context.scoring_hand == 5 then
        if not next(context.poker_hands["Straight"]) then
          if PB_UTIL.try_spawn_card { set = 'Tarot' } then
            return {
              message = localize('k_plus_tarot'),
              colour = G.C.SECONDARY_SET.Tarot
            }
          end
        else
          if PB_UTIL.try_spawn_card { set = 'Spectral' } then
            return {
              message = localize('k_plus_spectral'),
              colour = G.C.SECONDARY_SET.Spectral
            }
          end
        end
      end
    end
  end
}
