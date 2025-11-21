PB_UTIL.EGO_Gift {
  key = 'thrill',
  config = {
    sin = 'gluttony',
    a_xmult = 0.25,
    starting_xmult = 1,
  },
  atlas = 'ego_gift_atlas',
  pos = { x = 3, y = 0 },
  soul_pos = { x = 3, y = 3 },

  ego_loc_vars = function(self, info_queue, card)
    -- Outside Blind
    if not (G.GAME.blind and G.GAME.blind.in_blind) then
      return { vars = {
        card.ability.a_xmult,
        card.ability.starting_xmult,
      } }
    end
    -- In Blind, inactive
    if not (G.GAME.current_round.hands_played <= 0) then
      return {
        key = self.key..'_inactive',
        vars = {
          card.ability.a_xmult,
        },
        main_end = {
          -- from Luchador
          {n=G.UIT.C, config={align = "bm", minh = 0.4}, nodes={
            {n=G.UIT.C, config={ref_table = self, align = "m", colour = G.C.RED, r = 0.05, padding = 0.06}, nodes={
              {n=G.UIT.T, config={text = ' '..localize('paperback_inactive')..' ',colour = G.C.UI.TEXT_LIGHT, scale = 0.32*0.9}},
            }}
          }}
        }
      }
    end
    -- In Blind, active
    return {
      vars = {
        card.ability.a_xmult,
        card.ability.a_xmult * G.GAME.current_round.discards_used + card.ability.starting_xmult,
      }
    }
  end,

  ego_gift_calc = function(self, card, context)
    if context.pre_discard and not context.hook and G.GAME.current_round.hands_played <= 0 then
      return {
        message = localize {
          type = 'variable',
          key = 'a_xmult',
          vars = { card.ability.a_xmult * (1 + G.GAME.current_round.discards_used) + card.ability.starting_xmult }
        },
        colour = G.C.MULT
      }
    end

    if context.joker_main then
      if G.GAME.current_round.hands_played <= 0 then
        return {
          xmult = card.ability.a_xmult * G.GAME.current_round.discards_used + card.ability.starting_xmult
        }
      end
    end
  end,
}
