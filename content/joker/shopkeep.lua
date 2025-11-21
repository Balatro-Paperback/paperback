SMODS.Joker {
  key = "shopkeep",
  config = {
    extra = {
      count = 0,
      coupon_blinds_needed = 2,
    }
  },
  rarity = 3,
  pos = { x = 15, y = 7 },
  atlas = 'jokers_atlas',
  cost = 10,
  unlocked = false,
  blueprint_compat = true,
  eternal_compat = true,

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_TAGS.tag_coupon
    info_queue[#info_queue + 1] = G.P_TAGS.tag_voucher
    return { vars = {
      card.ability.extra.coupon_blinds_needed,
      card.ability.extra.count % card.ability.extra.coupon_blinds_needed
    } }
  end,

  check_for_unlock = function(self, args)
    if args.type == 'spend_in_one_shop' and to_number(args.spent) >= 50 then
      unlock_card(self)
    end
  end,

  calculate = function(self, card, context)
    if context.end_of_round and context.main_eval then
      -- Hacky way to make this increment once, even with Blueprints
      if not card.ability.extra.incremented then
        card.ability.extra.count = card.ability.extra.count + 1
        card.ability.extra.incremented = true -- reset in reset_game_globals
      end
      if card.ability.extra.count % card.ability.extra.coupon_blinds_needed == 0 then
        PB_UTIL.add_tag('tag_coupon')
        card:juice_up()
      end
    end

    if context.end_of_round and G.GAME.blind.boss and context.main_eval then
      PB_UTIL.add_tag('tag_voucher')
      card:juice_up()
    end
  end
}
