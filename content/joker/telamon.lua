SMODS.Joker {
  key = 'telamon',
  config = {
    extra = {
      hand = "Pair",
      active = false
    }
  },
  attributes = {
    'generation',
    'minor_arcana',
    'consumable',
    'hand_type'
  },
  rarity = 2,
  pos = { x = 18, y = 10 },
  atlas = 'jokers_atlas',
  cost = 6,
  unlocked = false,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,
  paperback = {
    requires_minor_arcana = true
  },

  paperback_credit = {
    coder = { 'dowfrin' }
  },

  check_for_unlock = function(self, args)
    local count = 0

    for k, v in pairs(G.GAME.consumeable_usage) do
      if v.set == "paperback_minor_arcana" and string.find(k, "swords", 1, true) then
        count = count + (v.count or 0)
      end
    end

    return count >= 3
  end,

  locked_loc_vars = function (self, info_queue, card)
    return {
      vars = {
        3
      }
    }
  end,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        localize(card.ability.extra.hand, 'poker_hands'),
        localize('k_paperback_minor_arcana')
      }
    }
  end,

  calculate = function(self, card, context)
    if context.after then
      if next(context.poker_hands[card.ability.extra.hand]) then
        card.ability.extra.active = true
      else
        card.ability.extra.active = false
      end
    end

    if context.end_of_round and card.ability.extra.active and context.main_eval then
      return nil, PB_UTIL.try_spawn_card {
        set = 'paperback_minor_arcana_swords',
        area = G.consumeables,
        func = function()
          SMODS.calculate_effect {
            message = localize('paperback_plus_minor_arcana'),
            colour = G.C.PAPERBACK_MINOR_ARCANA,
            card = context.blueprint_card or card
          }
        end }
    end
  end
}
