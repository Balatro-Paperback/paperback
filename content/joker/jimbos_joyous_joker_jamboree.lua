SMODS.Joker {
  key = "jimbos_joyous_joker_jamboree",
  config = {
    extra = {
      required = 13,
    }
  },
  pools = {
    Music = true
  },
  rarity = 2,
  pos = { x = 10, y = 10 },
  atlas = 'jokers_atlas',
  cost = 6,
  unlocked = false,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,
  paperback = {
    requires_minor_arcana = true
  },
  locked_loc_vars = function(self, info_queue, card)
    return {
      vars = {
        5
      }
    }
  end,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.required,
        card.ability.extra.required - (G.GAME.paperback.jjjj_count % card.ability.extra.required),
      }
    }
  end,

  check_for_unlock = function(self, args)
    if args.type == 'modify_deck' then
      local suits = {}
      for _, v in ipairs(G.playing_cards) do
        if not SMODS.has_no_suit(v) then
          suits[v.base.suit] = true
        end
      end

      local count = 0
      for _, v in pairs(suits) do
        count = count + 1
      end

      if count >= 5 then
        return true
      end
    end
  end,

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      if G.GAME.paperback.jjjj_count % card.ability.extra.required == 0 and G.GAME.paperback.jjjj_count > 0 then
        if PB_UTIL.try_spawn_card { set = 'paperback_minor_arcana', } then
          return {
            message = localize('paperback_plus_minor_arcana'),
            colour = G.C.PAPERBACK_MINOR_ARCANA,
            card = context.blueprint_card or card,
            message_card = context.blueprint_card or card
          }
        end
      end
    end
  end
}
