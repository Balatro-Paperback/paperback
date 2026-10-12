SMODS.Joker {
  key = "shopkeep",
  config = {
    extra = {
      count = 0,
      coupon_blinds_needed = 2,
      tags = { 'tag_coupon', 'tag_voucher' }
    }
  },
  attributes = {
    'economy',
    'generation',
    'tag',
    'shop',
    'boss_blind'
  },
  rarity = 3,
  pos = { x = 15, y = 7 },
  atlas = 'jokers_atlas',
  cost = 10,
  unlocked = false,
  blueprint_compat = true,
  eternal_compat = true,

  paperback_credit = {
    coder = { 'aa7' }
  },

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_TAGS.tag_coupon
    info_queue[#info_queue + 1] = G.P_TAGS.tag_voucher
    return {
      vars = {
        card.ability.extra.coupon_blinds_needed,
        card.ability.extra.count % card.ability.extra.coupon_blinds_needed,
        localize { type = 'name_text', key = card.ability.extra.tags[1], set = 'Tag' },
        localize { type = 'name_text', key = card.ability.extra.tags[2], set = 'Tag' }
      }
    }
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
        PB_UTIL.add_tag(card.ability.extra.tags[1])
        card:juice_up()
      end
    end

    if context.end_of_round and G.GAME.blind.boss and context.main_eval then
      PB_UTIL.add_tag(card.ability.extra.tags[2])
      card:juice_up()
    end
  end
}

-- Keep track of G.GAME.paperback.this_shop_dollars_spent
-- Redoing this a bit more accurately than Bunco
local inc_career_stat_ref = inc_career_stat
function inc_career_stat(stat, mod)
  if stat == 'c_shop_dollars_spent' then
    if to_big(mod) > to_big(0) then
      G.GAME.paperback.this_shop_dollars_spent = (G.GAME.paperback.this_shop_dollars_spent or 0) + mod
      check_for_unlock({ type = 'spend_in_one_shop', spent = G.GAME.paperback.this_shop_dollars_spent })
    end
  end
  return inc_career_stat_ref(stat, mod)
end

local toggle_shop_ref = G.FUNCS.toggle_shop
G.FUNCS.toggle_shop = function(e)
  toggle_shop_ref(e)
  if G.shop then
    G.GAME.paperback.this_shop_dollars_spent = nil
  end
end