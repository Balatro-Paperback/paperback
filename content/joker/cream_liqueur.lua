SMODS.Joker {
  key = "cream_liqueur",
  config = {
    extra = {
      rounds_reset = 3,
      rounds = 3,
      money = 5
    }
  },
  rarity = 1,
  pos = { x = 5, y = 6 },
  atlas = "jokers_atlas",
  cost = 4,
  unlocked = true,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = false,
  soul_pos = nil,
  pools = {
    Food = true
  },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.money,
        card.ability.extra.rounds,
        card.ability.extra.rounds == 1 and "" or "s"
      }
    }
  end,

  calculate = function(self, card, context)
    if context.paperback and context.paperback.using_tag then
      return {
        dollars = card.ability.extra.money
      }
    end

    if not context.blueprint and context.paperback and context.paperback.tag_acquired then
      if card.ability.extra.rounds > 0 and card.ability.extra.rounds < card.ability.extra.rounds_reset then
        card.ability.extra.rounds = card.ability.extra.rounds_reset

        return {
          message = localize('k_reset')
        }
      end
    end

    if not context.blueprint and context.end_of_round and context.main_eval then
      card.ability.extra.rounds = card.ability.extra.rounds - 1

      if card.ability.extra.rounds <= 0 then
        PB_UTIL.destroy_joker(card)

        return {
          message = localize('paperback_consumed_ex'),
          -- Brown color taken from the sprite
          colour = HEX("C4A07D")
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
  end,

  joker_display_def = function(JokerDisplay)
    return {
      reminder_text = {
        { text = '(',                       colour = G.C.UI.TEXT_INACTIVE },
        { ref_table = 'card.ability.extra', ref_value = 'rounds',         colour = G.C.IMPORTANT },
        { text = '/',                       colour = G.C.UI.TEXT_INACTIVE },
        { ref_table = 'card.ability.extra', ref_value = 'rounds_reset',   colour = G.C.UI.TEXT_INACTIVE },
        { text = ')',                       colour = G.C.UI.TEXT_INACTIVE },
      }
    }
  end
}
