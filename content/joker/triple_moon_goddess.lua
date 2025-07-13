if PB_UTIL.config.minor_arcana_enabled then
  SMODS.Joker {
    key = 'triple_moon_goddess_minor_arcana',
    config = {
      extra = {
        tarot_odds = 3,
        minor_arcana_odds = 6
      }
    },
    rarity = 2,
    pos = { x = 5, y = 4 },
    atlas = 'jokers_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    loc_vars = function(self, info_queue, card)
      local n1, d1 = PB_UTIL.chance_vars(card, nil, nil, card.ability.extra.tarot_odds)
      local n2, d2 = PB_UTIL.chance_vars(card, nil, nil, card.ability.extra.minor_arcana_odds)

      return {
        vars = {
          n1, d1,
          n2, d2
        }
      }
    end,

    calculate = function(self, card, context)
      if context.before and context.main_eval and next(context.poker_hands["Three of a Kind"]) then
        local eff_card = context.blueprint_card or card
        local triggered

        -- Tarot spawn
        if PB_UTIL.chance(card, 'triple_moon_goddess_tarot', nil, card.ability.extra.tarot_odds) then
          PB_UTIL.try_spawn_card { set = 'Tarot', func = function()
            SMODS.calculate_effect {
              message = localize('k_plus_tarot'),
              colour = G.C.SECONDARY_SET.Tarot,
              card = eff_card
            }

            triggered = true
          end }
        end

        -- Minor Arcana spawn
        if PB_UTIL.chance(card, 'triple_moon_goddess_minor_arcana', nil, card.ability.extra.minor_arcana_odds) then
          PB_UTIL.try_spawn_card { set = 'paperback_minor_arcana', func = function()
            SMODS.calculate_effect {
              message = localize('paperback_plus_minor_arcana'),
              colour = G.C.PAPERBACK_MINOR_ARCANA,
              card = eff_card
            }

            triggered = true
          end }
        end

        return nil, triggered
      end
    end
  }
else
  SMODS.Joker {
    key = 'triple_moon_goddess',
    config = {
      extra = {
        planet_odds = 3,
        tarot_odds = 3,
      }
    },
    rarity = 2,
    pos = { x = 5, y = 4 },
    atlas = 'jokers_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    soul_pos = nil,

    loc_vars = function(self, info_queue, card)
      local n1, d1 = PB_UTIL.chance_vars(card, nil, nil, card.ability.extra.planet_odds)
      local n2, d2 = PB_UTIL.chance_vars(card, nil, nil, card.ability.extra.tarot_odds)

      return {
        vars = {
          n1, d1,
          n2, d2
        }
      }
    end,

    calculate = function(self, card, context)
      if context.before and context.main_eval and next(context.poker_hands["Three of a Kind"]) then
        local eff_card = context.blueprint_card or card
        local triggered

        -- Check if planet card is generated and there is enough space in the consumeables area
        if PB_UTIL.chance(card, "Triple Moon Goddess (Planet)", nil, card.ability.extra.planet_odds) then
          PB_UTIL.try_spawn_card { set = 'Planet', func = function()
            SMODS.calculate_effect {
              message = localize('k_plus_planet'),
              colour = G.C.SECONDARY_SET.Planet,
              card = eff_card
            }

            triggered = true
          end }
        end

        -- Check if a tarot card is generated and there is enough space in the consumeables area
        if PB_UTIL.chance(card, "Triple Moon Goddess (Tarot)", nil, card.ability.extra.tarot_odds) then
          PB_UTIL.try_spawn_card { set = 'Tarot', func = function()
            SMODS.calculate_effect {
              message = localize('k_plus_tarot'),
              colour = G.C.SECONDARY_SET.Tarot,
              card = eff_card
            }

            triggered = true
          end }
        end

        return nil, triggered
      end
    end
  }
end
