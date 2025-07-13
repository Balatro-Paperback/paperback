SMODS.Joker {
  key = "ddakji",
  config = {
    extra = {
      odds = 4
    }
  },
  rarity = 3,
  pos = { x = 8, y = 6 },
  atlas = 'jokers_atlas',
  cost = 8,
  unlocked = true,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,

  loc_vars = function(self, info_queue, card)
    local numerator, denominator = PB_UTIL.chance_vars(card)

    return {
      vars = {
        numerator,
        denominator
      }
    }
  end,

  calculate = function(self, card, context)
    if context.before and context.main_eval then
      local face_down
      local face_up

      for _, v in ipairs(context.scoring_hand) do
        if v.ability.paperback_flipped then
          face_down = true
        else
          face_up = true
        end
      end

      if face_down and face_up then
        local type = PB_UTIL.poll_consumable_type('ddakji').key
        return nil, PB_UTIL.try_spawn_card {
          set = type,
          area = G.consumeables,
          soulable = true,
          key_append = 'ddakji',
          func = function()
            SMODS.calculate_effect({
              message = localize('paperback_plus_consumable'),
              colour = G.C.SECONDARY_SET[type] or G.C.TAROT
            }, context.blueprint_card or card)
          end
        }
      end
    end

    -- Clear the flipped mark at end of round
    if context.end_of_round and context.main_eval and not context.blueprint then
      for _, v in ipairs(G.playing_cards) do
        v.ability.paperback_flipped = nil
      end
    end
  end,

  joker_display_def = function(JokerDisplay)
    return {
      extra = {
        {
          { text = '(' },
          { ref_table = 'card.joker_display_values', ref_value = 'odds' },
          { text = ')' },
        },
      },
      extra_config = {
        colour = G.C.GREEN,
        scale = 0.3,
      },

      calc_function = function(card)
        card.joker_display_values.odds = localize { type = 'variable', key = 'jdis_odds', vars = { PB_UTIL.chance_vars(card) } }
      end,
    }
  end
}

local stay_flipped_ref = Blind.stay_flipped
function Blind.stay_flipped(self, area, card)
  if area == G.hand then
    local _, ddakji = next(SMODS.find_card('j_paperback_ddakji'))
    if ddakji and PB_UTIL.chance(ddakji, 'ddakji') then
      return true
    end
  end

  return stay_flipped_ref(self, area, card)
end

local emplace_ref = CardArea.emplace
function CardArea.emplace(self, card, location, stay_flipped)
  -- When a card is added to G.play, we check if it was previously flipped and mark it as such
  -- Since cards are flipped back to the front once played
  if self == G.play and card.facing == 'back' then
    card.ability.paperback_flipped = true
  end
  return emplace_ref(self, card, location, stay_flipped)
end
