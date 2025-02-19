SMODS.Suit {
  key = 'Crowns',
  card_key = 'CROWNS',

  lc_atlas = 'suits_lc',
  lc_ui_atlas = 'suits_ui_lc',
  lc_colour = G.C.PAPERBACK_CROWNS_LC,

  hc_atlas = 'suits_hc',
  hc_ui_atlas = 'suits_ui_hc',
  hc_colour = G.C.PAPERBACK_CROWNS_HC,

  pos = { y = 1 },
  ui_pos = { x = 0, y = 0 },

  in_pool = function(self, args)
    if args and args.initial_deck then
      -- When creating a deck
      local back = G.GAME.selected_back_key
      local config = SMODS.Centers[back.key].paperback

      return config and config.create_crowns
    else
      -- If not creating a deck
      return PB_UTIL.has_suit_in_deck('paperback_Crowns', true) or PB_UTIL.spectrum_played()
    end
  end
}
