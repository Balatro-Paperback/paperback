SMODS.Sticker {
  key = 'corroded',
  atlas = 'stickers_atlas',
  pos = { x = 2, y = 0 },
  badge_colour = G.C.PAPERBACK_EGO_GIFT_RED,
  rate = 0,
  should_apply = function(self, card, center, area, bypass_roll)
    return bypass_roll
  end,
  config = {
    paperback_corrode_tally = 3
  },

  -- Extra utility function
  info_queue_entry = function(self)
    return {
      key = 'paperback_corroded',
      set = 'Other',
      vars = self:loc_vars({}, {}).vars
    }
  end,

  loc_vars = function(self, info_queue, card)
    local rounds = (card.ability or {}).paperback_corrode_tally or G.GAME.paperback.corroded_rounds
    return {
      vars = {
        rounds,
        rounds == 1 and "" or "s"
      }
    }
  end,

  draw = function(self, card)
    -- Don't draw the shine over the sticker
    G.shared_stickers[self.key].role.draw_major = card
    G.shared_stickers[self.key]:draw_shader('dissolve', nil, nil, nil, card.children.center)
  end,


  apply = function(self, card, val)
    card.ability[self.key] = val
    card.ability.paperback_corrode_tally = G.GAME.paperback.corroded_rounds
  end,

  calculate = function(self, card, context)
    if context.end_of_round and context.cardarea == G.consumeables then
      if card.ability.paperback_corroded then
        if card.ability.paperback_corrode_tally then
          if card.ability.paperback_corrode_tally > 1 then
            card.ability.paperback_corrode_tally = card.ability.paperback_corrode_tally - 1
            SMODS.calculate_effect({
              message = localize {
                type = 'variable',
                key = 'paperback_a_round_minus',
                vars = { 1 }
              },
              colour = G.C.FILTER,
              instant = false
            }, card)
          else
            SMODS.calculate_context({
              paperback = {
                sold_ego_gift = card,
              }
            })
            if card.ability.sin ~= 'wrath' then
              SMODS.destroy_cards({ card })
            end

            return PB_UTIL.SIN_DEBUFF[card.ability.sin]
          end
        end
      end
    end
  end
}
