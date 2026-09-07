PB_UTIL.EGO_Gift {
  key = 'red_tassel',
  config = {
    sin = 'wrath',
    mult_mod = 1
  },
  atlas = 'ego_gift_atlas',
  pos = { x = 0, y = 3 },
  soul_pos = { x = 0, y = 7 },

  ego_loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.mult_mod
      }
    }
  end,

  paperback_credit = {
    coder = { 'thermo' },
    artist = { 'papermoonqueen', 'ari' }
  },

  ego_gift_calc = function(self, card, context)
    if context.before then
      local cards = {}

      for _, c in ipairs(context.scoring_hand) do
        if not SMODS.has_no_rank(c) then
          if next(cards) then
            local rank_a, rank_b = cards[1]:get_id(), c:get_id()
            if rank_a > rank_b then
              cards = {}
            elseif rank_a == rank_b then
              table.insert(cards, c)
              goto continue
            else
              goto continue
            end
          end
          table.insert(cards, c)
        end
        ::continue::
      end

      if not next(cards) then
        return
      end

      local card_to_upgrade = pseudorandom_element(cards, "red_tassel")
      card_to_upgrade.ability.perma_mult = (card_to_upgrade.ability.perma_mult or 0) + card.ability.mult_mod

      return {
        message = localize('k_upgrade_ex'),
        card = card_to_upgrade,
        message_card = card_to_upgrade
      }
    end
  end
}
