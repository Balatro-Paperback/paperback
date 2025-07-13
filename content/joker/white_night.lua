SMODS.Joker {
  key = "white_night",
  config = {
    extra = {
      xMult = 1.5
    }
  },
  rarity = 4,
  pos = { x = 8, y = 3 },
  soul_pos = { x = 9, y = 3 },
  atlas = "jokers_atlas",
  cost = 20,
  unlocked = false,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = false,
  paperback = {
    requires_ranks = true
  },

  specific_vars = {
    not_hidden = true
  },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.xMult
      }
    }
  end,

  locked_loc_vars = function(self, info_queue, card)
    return { vars = { 12 } }
  end,

  in_pool = function(self, args)
    return false
  end,

  check_for_unlock = function(self, args)
    if args.type == 'modify_deck' then
      local count = 0
      for _, v in ipairs(G.playing_cards) do
        if PB_UTIL.is_rank(v, 'paperback_Apostle') then count = count + 1 end
        if count >= 12 then return true end
      end
    end
    return false
  end,

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      if PB_UTIL.is_rank(context.other_card, 'paperback_Apostle') then
        if context.other_card.debuff then
          return {
            message = localize('k_debuffed'),
            colour = G.C.RED
          }
        else
          return {
            x_mult = card.ability.extra.xMult
          }
        end
      end
    end

    if context.destroy_card and not context.blueprint and context.cardarea == G.play then
      if not PB_UTIL.is_rank(context.destroy_card, 'paperback_Apostle') and not context.destroy_card.debuff then
        return { remove = true }
      end
    end

    if context.discard and not context.blueprint then
      if PB_UTIL.is_rank(context.other_card, 'paperback_Apostle') then
        return { remove = true }
      end
    end

    if context.after and not context.blueprint then
      local played_apostles = false
      for _, v in ipairs(context.full_hand) do
        if PB_UTIL.is_rank(v, 'paperback_Apostle') then
          played_apostles = true
          break
        end
      end

      if not played_apostles then
        local possible_jokers = {}
        for _, j in ipairs(G.jokers.cards) do
          if j ~= card and not SMODS.is_eternal(j, card) and not j.getting_sliced then
            possible_jokers[#possible_jokers + 1] = j
          end
        end

        local joker_to_destroy = pseudorandom_element(possible_jokers, pseudoseed('paperback_white_night'))

        if joker_to_destroy then PB_UTIL.destroy_joker(joker_to_destroy) end
      end
    end
  end
}
