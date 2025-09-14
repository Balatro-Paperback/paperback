SMODS.Joker {
  key = 'tian_tian',
  config = {
    extra = {
      a_xmult = 0.1,
      x_mult = 1,
    }
  },
  rarity = 3,
  pos = { x = 12, y = 9 },
  atlas = 'jokers_atlas',
  pools = {
    Music = true
  },
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
        card.ability.extra.a_xmult,
        card.ability.extra.x_mult,
      }
    }
  end,

  calculate = function(self, card, context)
-- Gains x_mult when playing cards are destroyed. Each card destroyed provides the specified xmult_mod
    if not context.blueprint and context.remove_playing_cards and context.removed and #context.removed > 0 then
      card.ability.extra.x_mult = card.ability.extra.x_mult + (#context.removed * card.ability.extra.a_xmult)

      card_eval_status_text(card, 'extra', nil, nil, nil,
        { message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.x_mult } } })
    end

    -- Gives the x_mult when scoring
    if context.joker_main then
      return {
        x_mult = card.ability.extra.x_mult
      }
    end
  end
}
