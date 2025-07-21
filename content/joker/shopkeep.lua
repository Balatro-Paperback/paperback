SMODS.Joker {
  key = "shopkeep",
  config = {
    extra = {
      tags = 1,
      count = 0
    }
  },
  rarity = 3,
  pos = { x = 15, y = 7 },
  atlas = 'jokers_atlas',
  cost = 10,
  unlocked = false,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_TAGS.tag_coupon
    info_queue[#info_queue + 1] = G.P_TAGS.tag_voucher

    return {
      vars = {
        card.ability.extra.tags,
        card.ability.extra.count,
      }
    }
  end,

  calculate = function(self, card, context)
    if context.end_of_round and context.main_eval then
      card.ability.extra.count = card.ability.extra.count + 1
      if card.ability.extra.count == 2 then
        PB_UTIL.add_tag('tag_coupon', nil, nil)
        card:juice_up()
        card.ability.extra.count = 0
      end
    end
    if context.end_of_round and G.GAME.blind.boss and context.main_eval then
      PB_UTIL.add_tag('tag_voucher', nil, nil)
      card:juice_up()
    end
  end
}
