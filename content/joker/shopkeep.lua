SMODS.Joker {
  key = "shopkeep",
  config = {
    extra = {
      count = 0,
      blueprint_count = 0
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
  end,

  check_for_unlock = function(self, args)
    if args.type == 'round_spend_money' and to_number(args.round_spend_money) >= 50 then
      unlock_card(self)
    end
  end,

  calculate = function(self, card, context)
    if context.first_hand_drawn and not context.blueprint then
      card.ability.extra.count = card.ability.extra.count + 1
    end

    if context.end_of_round and context.main_eval then
      if card.ability.extra.count > 0 and card.ability.extra.count % 2 == 0 then
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
