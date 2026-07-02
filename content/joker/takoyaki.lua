SMODS.Joker {
  key = "takoyaki",
  config = {
    extra = {
      rank = "8",
      dollars = 2,
      odds = 8,
      stick_key = 'j_paperback_bamboo_stick',
      eaten = false
    }
  },
  attributes = {
    'economy',
    'chance',
    'rank',
    'eight',
    'food'
  },
  rarity = 1,
  pos = { x = 24, y = 12 },
  atlas = 'jokers_atlas',
  cost = 6,
  unlocked = true,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = false,
  soul_pos = nil,
  yes_pool_flag = "takoyaki_can_spawn",
  pools = {
    Food = true
  },
  paperback_credit = {
    coder = { 'ThermoDyn' }
  },

  loc_vars = function(self, info_queue, card)
    local numerator, denominator = PB_UTIL.chance_vars(card)

    return {
      vars = {
        card.ability.extra.rank,
        card.ability.extra.dollars,
        numerator,
        denominator
      }
    }
  end,

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play and PB_UTIL.is_rank(context.other_card, card.ability.extra.rank) and not card.ability.extra.eaten then
      if PB_UTIL.chance(card, card.ability.extra.stick_key) then
        card.ability.extra.eaten = true
        return {
        dollars = card.ability.extra.dollars,
        message = localize('paperback_goner_ex'),
        colour = G.C.FILTER
      }
      end
      return {
        dollars = card.ability.extra.dollars,
      }
    end
    if context.after and card.ability.extra.eaten then
      PB_UTIL.destroy_joker(card, function()
        -- Remove this joker from the pool
        G.GAME.pool_flags[card.config.center.original_key .. "_can_spawn"] = false

        -- Create Popsicle Stick
        SMODS.add_card {
          key = card.ability.extra.stick_key,
          edition = card.edition
        }
      end)

      return {
        message = localize('k_eaten_ex'),
        colour = G.C.MULT,
        card = card
      }
    end
  end
  -- joker_display_def = PB_UTIL.stick_food_joker_display_def,
}