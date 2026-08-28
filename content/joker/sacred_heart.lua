SMODS.Joker {
  key = "sacred_heart",
  config = {
    extra = {
      poker_hand = "Flush Five"
    }
  },
  attributes = {
    'red',
    'retrigger',
    'hand_type',
    'perma_bonus',
    'modify_card'
  },
  rarity = 3,
  pos = { x = 5, y = 12 },
  atlas = "jokers_atlas",
  cost = 10,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,
  paperback = {

  },
  paperback_credit = {
    coder = { 'thermo' }
  },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        localize(card.ability.extra.poker_hand, 'poker_hands')
      }
    }
  end,

  in_pool = function(self, args)
    -- Only in pool if you have played a Five of a Kind or a Flush Five
    return PB_UTIL.any_hand_played("Flush Five")
  end,

  calculate = function(self, card, context)
    if context.after and context.scoring_name == card.ability.extra.poker_hand then
      context.scoring_hand[1].ability.perma_repetitions = (context.scoring_hand[1].ability.perma_repetitions or 0) + 1
      if not context.blueprint_card then
        -- collect all cards to destroy
        local destroy = {}
        for _, v in ipairs(context.scoring_hand) do
          table.insert(destroy, v)
        end
        table.remove(destroy, 1)
        SMODS.destroy_cards(destroy)
      end
      return {
        message = localize('k_upgrade_ex'),
        colour = G.C.ORANGE,
        message_card = context.scoring_hand[1]
      }
    end
  end
}
