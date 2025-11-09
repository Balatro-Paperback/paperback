SMODS.Joker {
  key = "the_strongest",
  rarity = 3,
  pos = { x = 13, y = 5 },
  atlas = "jokers_atlas",
  cost = 4,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = false,
  paperback = {
    requires_ego_gifts = true
  },
  config = {
    extra = {
      xmult = 1,
      xmult_mod = 0.5
    }
  },
  unlocked = false,
  check_for_unlock = function(self, args)
    if args.type == 'paperback_sold_ego_gifts' then
      return #G.GAME.paperback.sold_ego_gifts >= 1
    end
  end,

  in_pool = function(self, args)
    for _, v in ipairs(G.consumeables or {}) do
      if PB_UTIL.is_ego_gift(v) then return true end
    end
  end,

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = SMODS.Stickers['paperback_corroded']:info_queue_entry()
    return {
      vars = {
        card.ability.extra.xmult_mod,
        card.ability.extra.xmult
      }
    }
  end,

  calculate = function(self, card, context)
    -- Upgrade when a sin is activated
    if context.paperback and context.paperback.sold_ego_gift then
      card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmult_mod
      return {
        message = localize {
          type = 'variable',
          key = 'a_xmult',
          vars = { card.ability.extra.xmult }
        },
        colour = G.C.RED
      }
    end

    if context.end_of_round and context.cardarea == G.jokers and G.GAME.blind.boss then
      local gifts = {}
      for i = 1, #G.consumeables.cards do
        if G.consumeables.cards[i].ability.set == 'paperback_ego_gift' and not G.consumeables.cards[i].ability.paperback_corroded then
          gifts[#gifts + 1] = G.consumeables.cards[i]
        end
      end
      if next(gifts) then
        pseudorandom_element(gifts, pseudoseed("the_strongest_corrode")):add_sticker('paperback_corroded', true)
      end
    end

    if context.joker_main then
      return {
        xmult = card.ability.extra.xmult
      }
    end
  end,

  joker_display_def = function(JokerDisplay)
    return {
      text = {
        {
          border_nodes = {
            { text = "X" },
            { ref_table = "card.ability.extra", ref_value = "xmult", retrigger_type = "exp" }
          }
        }
      },
    }
  end,
}
