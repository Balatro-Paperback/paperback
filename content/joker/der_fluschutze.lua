SMODS.Joker {
  key = "der_fluschutze",
  rarity = 3,
  config = {
    extra = {
      Xmult_mod = 0.25,
      x_mult = 1,
      active = false,
    }
  },
  pos = { x = 14, y = 5 },
  atlas = 'jokers_atlas',
  cost = 9,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = false,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.Xmult_mod,
        card.ability.extra.x_mult
      }
    }
  end,

  calculate = function(self, card, context)
    --Increase mult counter if card is a face
    if not context.blueprint and context.before and #context.full_hand == 1 then
      if G.GAME.current_round.hands_played == 0 and context.scoring_hand[1]:is_face() then
        card.ability.extra.x_mult = card.ability.extra.x_mult + card.ability.extra.Xmult_mod
        card.ability.extra.active = true

        return {
          message = localize('k_upgrade_ex'),
        }
      end
    end

    --Destroy Face card
    if context.destroy_card and card.ability.extra.active and not context.blueprint then
      card.ability.extra.active = false

      return {
        remove = true
      }
    end

    --Play Xmult
    if context.joker_main then
      return {
        x_mult = card.ability.extra.x_mult,
      }
    end
  end
}
