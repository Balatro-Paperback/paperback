SMODS.Voucher {
  key = 'rabbit_protocol',
  atlas = 'vouchers_atlas',
  pos = { x = 2, y = 1 },
  unlocked = false,
  discovered = false,
  requires = {
    'v_paperback_second_trumpet'
  },
  paperback = {
    requires_ego_gifts = true,
  },
  locked_loc_vars = function(self, info_queue)
    return { vars = { 3 } }
  end,

  check_for_unlock = function(self, args)
    if args.type == 'paperback_sold_ego_gifts' then
      return #G.GAME.paperback.sold_ego_gifts >= 3
    end
  end,

  calculate = function(self, card, context)
    if context.selling_card and G.GAME.blind then
      if PB_UTIL.is_ego_gift(context.card) and G.GAME.blind.boss and not G.GAME.blind.disabled then
        return {
          focus = context.card,
          message = localize('ph_boss_disabled'),
          func = function()
            G.GAME.blind:disable()
          end
        }
      end
    end
  end
}
