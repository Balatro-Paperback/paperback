SMODS.Joker {
  key = "j_and_js",
  config = {
    extra = {
      tags = 2,
      rounds = 3,
      rounds_reset = 3,
    }
  },
  rarity = 2,
  pos = { x = 11, y = 8 },
  atlas = "jokers_atlas",
  cost = 6,
  blueprint_compat = true,
  eternal_compat = false,
  perishable_compat = true,
  paperback = {
    requires_custom_suits = true,
    requires_spectrum_or_suit = true
  },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.tags,
        card.ability.extra.rounds
      }
    }
  end,

  calculate = function(self, card, context)
    if context.before and context.main_eval then
      if PB_UTIL.contains_spectrum(context.poker_hands) then
        for i = 1, card.ability.extra.tags do
          -- Only play sound on the last tag
          PB_UTIL.add_tag(PB_UTIL.poll_tag('j_and_js'), true, i < card.ability.extra.tags)
        end

        return {
          message = localize {
            type = 'variable',
            key = 'paperback_a_plus_tags',
            vars = { card.ability.extra.tags }
          }
        }
      end
    end

    if not context.blueprint and context.end_of_round and context.main_eval then
      card.ability.extra.rounds = card.ability.extra.rounds - 1

      if card.ability.extra.rounds <= 0 then
        PB_UTIL.destroy_joker(card)

        return {
          message = localize('paperback_consumed_ex'),
          colour = G.C.MULT
        }
      else
        return {
          message = localize {
            type = 'variable',
            key = 'a_remaining',
            vars = { card.ability.extra.rounds }
          }
        }
      end
    end
  end
}
