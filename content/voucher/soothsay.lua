SMODS.Voucher {
  key = 'soothsay',
  atlas = 'vouchers_atlas',
  pos = { x = 0, y = 1 },
  discovered = false,
  unlocked = false,
  check_for_unlock = function(self, args)
    return PB_UTIL.count_used_consumables("paperback_minor_arcana", true) >= 10
  end,
  locked_loc_vars = function(self, info_queue, card)
    return { vars = { 10 } }
  end,
  requires = {
    'v_paperback_celtic_cross'
  },
  paperback = {
    requires_minor_arcana = true,
  },

  redeem = function(self, card)
    -- 3 is the default rate for Tarots with no vouchers
    G.GAME.paperback_minor_arcana_rate = 3
  end,
}
