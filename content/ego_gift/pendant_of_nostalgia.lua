PB_UTIL.EGO_Gift {
  key = 'pendant_of_nostalgia',
  config = {
    sin = 'gloom',
  },
  atlas = 'ego_gift_atlas',
  pos = { x = 4, y = 0 },
  soul_pos = { x = 4, y = 3 },


  ego_gift_calc = function(self, card, context)
    if context.remove_playing_cards then
      for count = 1, #context.removed do
        if PB_UTIL.can_spawn_card(G.consumeables) then
          local roll = pseudorandom(pseudoseed('pendant_of_nostalgia'))
          if roll > 0.49 then
            PB_UTIL.try_spawn_card { set = 'paperback_minor_arcana', }

            SMODS.calculate_effect({
              message = localize('paperback_plus_minor_arcana'),
              colour = G.C.PAPERBACK_MINOR_ARCANA,
              card = card,
              message_card = card
            })
          else
            PB_UTIL.try_spawn_card { set = 'Tarot', }
            SMODS.calculate_effect({
              message = localize('k_plus_tarot'),
              colour = G.C.TAROT,
              card = card,
              message_card = card
            })
          end
        end
      end
    end
  end
}
