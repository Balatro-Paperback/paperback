PB_UTIL.EGO_Gift {
  key = 'dark_vestige',
  config = {
    sin = 'none'
  },
  atlas = 'ego_gift_atlas',
  pos = { x = 7, y = 0 },
  soul_pos = { x = 7, y = 3 },
  cost = 5,

  in_pool = function(self, args)
    -- bans dark vestige from appearing in ego gift extraction packs UNLESS it is the only spawnable card
    return args.source ~= 'paperback_extr'
  end
}
