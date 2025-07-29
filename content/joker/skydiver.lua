SMODS.Joker {
  key = 'skydiver',
  config = {
    extra = {
      x_mult = 2,
      lowest_rank = 'Ace',
    }
  },
  pools = {
    Music = true
  },
  rarity = 2,
  pos = { x = 4, y = 1 },
  atlas = 'jokers_atlas',
  cost = 6,
  unlocked = true,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,
  soul_pos = nil,

  loc_vars = function(self, info_queue, card)
    local lowest_rank = localize(card.ability.extra.lowest_rank, 'ranks')

    return {
      vars = {
        card.ability.extra.x_mult,
        lowest_rank
      }
    }
  end,

  set_ability = function(self, card, initial, delay_sprites)
    if initial then
      PB_UTIL.reset_skydiver(card)
    end
  end,

  -- Calculate function for the Joker
  calculate = function(self, card, context)
    if not card.debuff then
      -- Give the xMult during play if conditions are met
      if context.joker_main then
        local active = true

        -- If there is a scored card with a rank that has a higher rank than the lowest
        -- recorded by this joker, do not trigger the effect
        for _, v in ipairs(context.scoring_hand) do
          if not SMODS.has_no_rank(v) and PB_UTIL.compare_ranks(v:get_id(), card.ability.extra.lowest_rank) then
            active = false
            break
          end
        end

        if active then
          return {
            x_mult = card.ability.extra.x_mult,
            card = card
          }
        end
      end

      if context.after and context.main_eval and not context.blueprint then
        local last_lowest = card.ability.extra.lowest_rank

        if context.scoring_hand then
          for _, v in pairs(context.scoring_hand) do
            if not SMODS.has_no_rank(v) then
              local other_rank = v.base.value

              -- If the lowest rank is higher than or equal to the new rank, that means we have a new low
              if PB_UTIL.compare_ranks(last_lowest, other_rank, true) then
                last_lowest = other_rank
              end
            end
          end

          -- If the rank was updated
          if card.ability.extra.lowest_rank ~= last_lowest then
            card.ability.extra.lowest_rank = last_lowest

            return {
              message = localize(card.ability.extra.lowest_rank, 'ranks'),
            }
          end
        end
      end

      if context.end_of_round and context.main_eval and not context.blueprint then
        PB_UTIL.reset_skydiver(card)

        return {
          message = localize('k_reset'),
          colour = G.C.MULT
        }
      end
    end
  end
}

function PB_UTIL.reset_skydiver(card)
  local highest_rank = PB_UTIL.get_sorted_ranks()[1]
  if PB_UTIL.config.ranks_enabled then
    local apostle_in_deck = false
    for _, v in pairs(G.playing_cards or {}) do
      if PB_UTIL.is_rank(v, 'paperback_Apostle') then
        apostle_in_deck = true
        break
      end
    end
    if highest_rank.key == 'paperback_Apostle' and not apostle_in_deck then
      highest_rank = PB_UTIL.get_sorted_ranks()[2]
    end
  end
  card.ability.extra.lowest_rank = highest_rank.key
end
