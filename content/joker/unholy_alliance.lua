SMODS.Joker {
  key = 'unholy_alliance',
  config = {
    extra = {
      a_chips = 12,
      chips = 0,
      revive_treshold = 666
    }
  },
  rarity = 1,
  pos = { x = 6, y = 4 },
  atlas = 'jokers_atlas',
  cost = 7,
  unlocked = true,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = false,
  soul_pos = nil,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.a_chips,
        card.ability.extra.chips,
      }
    }
  end,

  calculate = function(self, card, context)
    -- Gains chips when jokers are destroyed
    if not context.blueprint and context.paperback and context.paperback.destroying_joker then
      -- Make sure that this joker isn't being removed
      if card ~= context.paperback.destroyed_joker then
        card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.a_chips

        return {
          message = localize {
            type = 'variable',
            key = 'a_chips',
            vars = { card.ability.extra.a_chips }
          },
          colour = G.C.CHIPS
        }
      end
    end

    -- Gains chips when playing cards are destroyed. Each card destroyed provides the specified chip_mod
    if not context.blueprint and context.remove_playing_cards and context.removed and #context.removed > 0 then
      card.ability.extra.chips = card.ability.extra.chips + (#context.removed * card.ability.extra.a_chips)

      card_eval_status_text(card, 'extra', nil, nil, nil,
        { message = localize { type = 'variable', key = 'a_chips', vars = { card.ability.extra.chips } } })
    end

    -- Gives the chips when scoring
    if context.joker_main then
      return {
        chips = card.ability.extra.chips
      }
    end

    -- Revive ability when chips is 666 or higher
    if not context.blueprint and context.end_of_round and context.game_over then
      if card.ability.extra.chips >= card.ability.extra.revive_treshold then
        PB_UTIL.destroy_joker(card)

        return {
          message = localize('k_saved_ex'),
          saved = 'paperback_saved_unholy_alliance',
          colour = G.C.MULT
        }
      end
    end
  end
}
