SMODS.Joker {
  key = "joker_jacks",
  config = {
    extra = {
      dollars = 3,
      m_dollars = 1,
      rank = "Jack",
      -- M.A Enabled vs Disabled
      consumable_odds = {
        -- 30% vs 42.85%
        'Planet',
        'Planet',
        'Planet',
        -- 30% vs 42.85%
        'Tarot',
        'Tarot',
        'Tarot',
        -- 10% vs 15.4%
        'Spectral',
        -- 30% vs 0%
      }
    }
  },
  attributes = {
    'generation',
    'rank',
    'jack',
    'economy',
    'red',
    'food'
  },
  pools = {
    Food = true
  },
  rarity = 1,
  pos = { x = 13, y = 12 },
  atlas = "jokers_atlas",
  cost = 6,
  blueprint_compat = true,
  eternal_compat = false,
  perishable_compat = true,
  paperback_credit = {
    coder = { 'thermo' }
  },
  unlocked = false,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.dollars,
        card.ability.extra.rank,
        card.ability.extra.m_dollars
      }
    }
  end,

  check_for_unlock = function(self, args)
    if args.type == 'paperback_played_three_jacks' then
      return true
    end
  end,

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      if PB_UTIL.is_rank(context.other_card, card.ability.extra.rank) then
        return {
          dollars = card.ability.extra.dollars
        }
      end
    end
    if context.end_of_round and context.main_eval and not context.blueprint_card then
      if card.ability.extra.dollars - card.ability.extra.m_dollars < 1 then
        -- Selecting and creating the card
        local odds = card.ability.extra.consumable_odds
        if PB_UTIL.config.minor_arcana_enabled then
          for i = 1, 3, 1 do
            table.insert(odds, 'paperback_minor_arcana')
          end
        end
        local set = pseudorandom_element(odds, "joker_jacks_prize")
        if PB_UTIL.try_spawn_card { set = set } then
          card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil,
            {
              message = localize('paperback_plus_consumable'),
              colour = G.C.ORANGE
            })
        end

        -- Consuming
        PB_UTIL.destroy_joker(card)
        return {
          message = localize('paperback_consumed_ex'),
          colour = G.C.MULT
        }
      end
      SMODS.scale_card(card, {
        ref_table = card.ability.extra,
        ref_value = 'dollars',
        scalar_value = 'm_dollars',
        operation = '-',
        scaling_message = {
          message = localize {
            type = 'variable',
            key = 'paperback_a_dollars_minus',
            vars = { card.ability.extra.m_dollars }
          },
          colour = G.C.ORANGE
        }
      })
      return nil, true
    end
  end
}
