SMODS.Joker {
  key = "bergentrucking",
  config = {
    extra = {
      upgrade = "perma_x_mult",
      a_x_mult = 0.05,
      suit = 'paperback_Crowns',
      destroy_suit = 'Hearts',
      active = { suit = false, destroy_suit = false }
    }
  },
  attributes = {
    'red',
    'xmult',
    'modify_card',
    'perma_bonus',
    'suit',
    'hearts',
    'crowns'
  },
  rarity = 3,
  pos = { x = 23, y = 4 },
  atlas = "jokers_atlas",
  cost = 8,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,
  paperback_credit = {
    coder = { 'ThermoDyn' }
  },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        localize(card.ability.extra.suit, 'suits_plural'),
        card.ability.extra.a_x_mult,
        localize(card.ability.extra.destroy_suit, 'suits_singular'),
        localize(card.ability.extra.destroy_suit, 'suits_plural')
      }
    }
  end,

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      if context.other_card:is_suit(card.ability.extra.suit) then
        card.ability.extra.active.suit = true
      end
      if context.other_card:is_suit(card.ability.extra.destroy_suit) then
        card.ability.extra.active.destroy_suit = true
      end
    end

    if context.joker_main and card.ability.extra.active.suit and card.ability.extra.active.destroy_suit then
      for _, scoring_card in ipairs(context.scoring_hand) do
        if scoring_card:is_suit(card.ability.extra.suit) then
          scoring_card.ability[card.ability.extra.upgrade] = (scoring_card.ability[card.ability.extra.upgrade] or 1) +
              card.ability.extra.a_x_mult
        end
      end
      return {
        message = localize('k_upgrade_ex')
      }
    end

    if context.destroy_card and context.cardarea == G.play and (card.ability.extra.active.suit and card.ability.extra.active.destroy_suit) then
      if context.destroy_card:is_suit(card.ability.extra.destroy_suit) then
        return {
          remove = true
        }
      end
    end

    if context.after then
      card.ability.extra.active = { suit = false, destroy_suit = false }
    end
  end
}
