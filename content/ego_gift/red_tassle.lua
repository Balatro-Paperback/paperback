PB_UTIL.EGO_Gift {
  key = 'red_tassle',
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
      local cards, indecies = {}, {}
      for i, c in ipairs(context.scoring_hand) do
        if not SMODS.has_no_rank(c) then
          if next(cards) then
            if cards[1].base.nominal > c.base.nominal then
              cards, indecies = {}, {}
              table.insert(cards, c)
              table.insert(indecies, i)
              goto continue
            end
            if cards[1].base.nominal == c.base.nominal then
              table.insert(cards, c)
              table.insert(indecies, i)
              goto continue
            end
          else
            table.insert(cards, c)
            table.insert(indecies, i)
          end
        end
        ::continue::
      end
      if not next(indecies) then
        return nil, true
      end
      local card_to_upgrade = (context.scoring_hand[pseudorandom_element(indecies, "red_tassle")])
      card_to_upgrade.ability.perma_mult = (card_to_upgrade.ability.perma_mult or 0)
          + card.ability.mult_mod
      return {
        message = localize('k_upgrade_ex'),
        card = card_to_upgrade,
        message_card = card_to_upgrade
      }
    end
  end
}
