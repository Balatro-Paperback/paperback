PB_UTIL.EGO_Gift {
  key = 'dark_vestige',
  config = {
    sin = 'none'
  },
  attributes = {},
  atlas = 'ego_gift_atlas',
  pos = { x = 7, y = 0 },
  soul_pos = { x = 7, y = 4 },
  cost = 5,

  in_pool = function(self, args)
    -- bans dark vestige from appearing UNLESS it is the only spawnable card
    return false
  end
}
