PB_UTIL.EGO_Gift {
  key = "hardwood_liquor_cup",
  config = {
    sin = 'gluttony',
    extra = {
      perma_bonus = 10,
      perma_mult = 2,
      perma_p_dollars = 1,
      perma_x_mult = 0.05
    }
  },
  pos = { x = 3, y = 3 },
  soul_pos = { x = 3, y = 7 },
  atlas = "ego_gift_atlas",
  paperback_credit = {
    coder = { 'thermo' },
    artist = { 'papermoonqueen', 'ari' }
  },

  ego_loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.perma_bonus,
        card.ability.extra.perma_mult,
        card.ability.extra.perma_p_dollars,
        card.ability.extra.perma_x_mult
      }
    }
  end,

  ego_gift_calc = function(self, card, context)
    if context.before and context.main_eval and G.GAME.current_round.hands_left == 0 then
      local base = 0
      local upgrade = pseudorandom_element({
        "perma_bonus",
        "perma_mult",
        "perma_p_dollars",
        "perma_x_mult"
      }, "hardwood_liquor_cup")
      if upgrade == "perma_x_mult" then
        base = 1
      end
      context.scoring_hand[1].ability[upgrade] = (context.scoring_hand[1].ability[upgrade] or base) +
          card.ability.extra[upgrade]
      return {
        message = localize('k_upgrade_ex'),
        colour = G.C.RED,
        message_card = context.scoring_hand[1]
      }
    end
  end
}
