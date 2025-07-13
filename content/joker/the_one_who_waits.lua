SMODS.Joker {
  key = "the_one_who_waits",
  config = {
    extra = {
      suit = 'paperback_Crowns',
      upgrade_odds = 3,
      x_mult = 1,
      x_mult_mod = 0.1,
      tarot_odds = 5
    }
  },
  rarity = 3,
  pos = { x = 14, y = 6 },
  atlas = "jokers_atlas",
  cost = 8,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,
  paperback = {
    requires_custom_suits = true
  },

  in_pool = function(self, args)
    return PB_UTIL.spectrum_played() or PB_UTIL.has_suit_in_deck('paperback_Crowns', true)
  end,

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.c_death

    local n1, d1 = PB_UTIL.chance_vars(card, nil, nil, card.ability.extra.upgrade_odds)
    local n2, d2 = PB_UTIL.chance_vars(card, nil, nil, card.ability.extra.tarot_odds)

    return {
      vars = {
        localize(card.ability.extra.suit, 'suits_singular'),
        n1,
        d1,
        card.ability.extra.x_mult_mod,
        n2,
        d2,
        localize {
          type = 'name_text',
          set = 'Tarot',
          key = 'c_death'
        },
        card.ability.extra.x_mult,
        colours = {
          G.C.SUITS[card.ability.extra.suit] or G.C.PAPERBACK_CROWNS_LC
        }
      }
    }
  end,

  calculate = function(self, card, context)
    if context.before and not context.blueprint then
      local has_suit

      for _, v in ipairs(context.scoring_hand) do
        if v:is_suit(card.ability.extra.suit) then
          has_suit = true
          break
        end
      end

      if has_suit then
        local effects

        if PB_UTIL.chance(card, "the_one_who_waits_upgrade", nil, card.ability.extra.upgrade_odds) then
          card.ability.extra.x_mult = card.ability.extra.x_mult + card.ability.extra.x_mult_mod

          effects = {
            message = localize {
              type = 'variable',
              key = 'a_xmult',
              vars = { card.ability.extra.x_mult }
            },
            colour = G.C.MULT
          }
        end

        if PB_UTIL.chance(card, "the_one_who_waits_tarot", nil, card.ability.extra.tarot_odds) then
          if PB_UTIL.try_spawn_card { key = 'c_death' } then
            effects = effects or {}
            effects.extra = {
              message = localize('k_plus_tarot'),
              colour = G.C.SECONDARY_SET.Tarot,
            }
          end
        end

        return effects
      end
    end

    if context.joker_main then
      return {
        x_mult = card.ability.extra.x_mult
      }
    end
  end
}
