if PB_UTIL.should_load_spectrum_items() then
  SMODS.Joker {
    key = "yacht",
    config = {
      extra = {
        chips = 0,
        change = 10,
        suits = {
          'paperback_Stars',
          'paperback_Crowns'
        }
      }
    },
    rarity = 1,
    pos = { x = 23, y = 5 },
    atlas = "jokers_atlas",
    cost = 5,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    paperback = {
      requires_custom_suits = true,
      requires_spectrum_or_suit = true
    },
    paperback_credit = {
      coder = { 'thermo' }
    },
    loc_vars = function(self, info_queue, card)
      return {
        vars = {
          card.ability.extra.change,
          card.ability.extra.chips,
          localize(card.ability.extra.suits[1], 'suits_singular'),
          localize(card.ability.extra.suits[2], 'suits_singular')
        }
      }
    end,

    calculate = function(self, card, context)
      if context.before then
        local suit_count = 0
        for _, v in pairs(context.scoring_hand) do
          if v:is_suit(card.ability.extra.suits[1]) or v:is_suit(card.ability.extra.suits[2]) then
            suit_count = suit_count + 1
          end
        end
        if suit_count > 0 then
          card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.change
          return {
            message = localize("k_upgrade_ex"),
            colour = G.C.ORANGE
          }
        end
      end
      if context.joker_main and card.ability.extra.chips > 0 then
        return {
          chips = card.ability.extra.chips
        }
      end
    end
  }
end
