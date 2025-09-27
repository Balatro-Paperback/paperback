PB_UTIL.EGO_Gift {
  key = 'chalice_of_trickle_down',
  config = {
    sin = 'envy',
  },
  atlas = 'ego_gift_atlas',
  pos = { x = 6, y = 1 },
  soul_pos = { x = 6, y = 4 },

  ego_gift_calc = function(self, card, context)
    if context.before and G.GAME.blind.boss then
      local smallest, index
      -- check if the scoring hand has atleast one rank card
      for i, v in ipairs(context.scoring_hand) do
        if not SMODS.has_no_rank(v) then
          smallest, index = context.scoring_hand[i].base.nominal, i
          break
        end
      end
      -- check if a viable card has been found
      if smallest then
        -- find the smallest rank
        for i, v in ipairs(context.scoring_hand) do
          if not SMODS.has_no_rank(v) then
            if smallest > v.base.nominal then
              smallest = v.base.nominal
              index = i
            end
          end
        end

        return {
          dollars = smallest,
          card = context.scoring_hand[index]
        }
      end
    end
  end
}
