SMODS.Joker {
  key = "j_and_js",
  config = {
    extra = {
      tags = 2,
      rounds = 3,
      rounds_reset = 3,
    }
  },
  attributes = {
    'generation',
    'tag',
    'hand_type',
    'red'
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
  unlocked = false,
  paperback_credit = {
    coder = { 'srockw' },
  },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.tags,
        card.ability.extra.rounds
      }
    }
  end,

  locked_loc_vars = function(self, info_queue, card)
    return {
      vars = {
        6
      }
    }
  end,
  check_for_unlock = function(self, args)
    if args.type == 'modify_deck' then
      local suits = {}
      for _, v in ipairs(G.playing_cards) do
        if not SMODS.has_no_suit(v) then
          suits[v.base.suit] = true
        end
      end

      local count = 0
      for _, v in pairs(suits) do
        count = count + 1
      end

      if count >= 6 then
        return true
      end
    end
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
