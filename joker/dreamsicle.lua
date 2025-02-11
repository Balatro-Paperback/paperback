SMODS.Joker {
  key = "dreamsicle",
  config = {
    extra = {
      mult = 5,
      odds = 4
    }
  },
  rarity = 1,
  pos = { x = 8, y = 2 },
  atlas = 'jokers_atlas',
  cost = 6,
  unlocked = true,
  discovered = true,
  blueprint_compat = true,
  eternal_compat = false,
  soul_pos = nil,
  yes_pool_flag = "dreamsicle_can_spawn",
  pools = {
    Food = true
  },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.mult,
        G.GAME.probabilities.normal,
        card.ability.extra.odds
      }
    }
  end,

  calculate = function(self, card, context)
    -- Give the mult during play if card is a Diamond
    if context.individual and context.cardarea == G.play then
      if context.other_card:is_suit("Diamonds") then
        return {
          mult = 5,
          card = card
        }
      end
    end

    -- Check if the Joker needs to be eaten
    if context.end_of_round and not context.blueprint and not (context.individual or context.repetition) then
      if pseudorandom("Dreamsicle") < G.GAME.probabilities.normal / card.ability.extra.odds then
        PB_UTIL.destroy_joker(card, function()
          -- Remove Dreamsicle from the pool
          G.GAME.pool_flags.dreamsicle_can_spawn = false

          -- Create Popsicle Stick
          SMODS.add_card {
            key = 'j_paperback_popsicle_stick',
            edition = card.edition
          }
        end)

        return {
          message = localize('k_eaten_ex'),
          colour = G.C.MULT,
          card = card
        }
      else
        return {
          message = localize('k_safe_ex'),
          colour = G.C.CHIPS,
          card = card
        }
      end
    end
  end
}
