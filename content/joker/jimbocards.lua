SMODS.Joker {
  key = "jimbocards",
  config = {
    extra = {
      num_to_gen = 7,
      hands_to_death = 3,
      hands_reset = 3,
      discount = 3,
    }
  },
  rarity = 3,
  pos = { x = 8, y = 7 },
  atlas = "jokers_atlas",
  cost = 14,
  blueprint_compat = false,
  eternal_compat = true,
  perishable_compat = false,
  paperback = {
    permanently_eternal = true,
  },
  unlocked = false,
  locked_loc_vars = function(self, info_queue, card)
    return { vars = { 13 }, key = 'j_paperback_jimbocards_collection' }
  end,
  check_for_unlock = function(self, args)
    return args.type == 'ante_up' and args.ante >= 13
  end,

  in_pool = function(self, args)
    return args and args.source and (args.source == 'sho' or args.source == 'buf')
  end,

  loc_vars = function(self, info_queue, card)
    if card.area and card.area.config.collection then
      info_queue[#info_queue + 1] = { key = 'eternal', set = 'Other' }
    end
    return {
      key = card.area and card.area.config.collection and 'j_paperback_jimbocards_collection' or nil,
      vars = {
        card.ability.extra.num_to_gen,
        card.ability.extra.discount,
        card.ability.extra.hands_reset,
        card.ability.extra.hands_to_death,
      }
    }
  end,

  set_ability = function(self, card, initial, delay_sprites)
    card:add_sticker('eternal', true)
  end,

  update = function(self, card, dt)
    -- Remove eternal in collection (this is inefficient)
    if card.ability.eternal and card.area and card.area.config.collection then
      card.ability.eternal = nil
    end
  end,

  add_to_deck = function(self, card, from_debuff)
    -- Apply discount
    G.GAME.inflation = G.GAME.inflation - card.ability.extra.discount
    -- Code taken from base game, search 'G.GAME.modifiers.inflation'
    G.E_MANAGER:add_event(Event({
      func = function()
        for k, v in pairs(G.I.CARD) do
          if v.set_cost then v:set_cost() end
        end
        return true
      end
    }))

    -- Destroy all Jokers currently in possession (not itself)
    G.E_MANAGER:add_event(Event {
      trigger = 'immediate',
      func = function()
        for _, v in ipairs(G.jokers.cards) do
          if v ~= card then
            PB_UTIL.destroy_joker(v)
          end
        end
        return true
      end,
    })

    -- Generate the random negative Jokers
    G.E_MANAGER:add_event(Event {
      trigger = 'immediate',
      func = function()
        for i = 1, card.ability.extra.num_to_gen do
          SMODS.add_card({
            set = 'Joker',
            area = G.jokers,
            edition = 'e_negative',
            key_append = '_jimbocards',
          })
        end
        return true
      end,
    })
  end,

  remove_from_deck = function(self, card, from_debuff)
    -- Remove discount
    G.GAME.inflation = G.GAME.inflation + card.ability.extra.discount
    G.E_MANAGER:add_event(Event({
      func = function()
        for k, v in pairs(G.I.CARD) do
          if v.set_cost then v:set_cost() end
        end
        return true
      end
    }))
  end,

  calculate = function(self, card, context)
    if context.before and not context.blueprint then
      card.ability.extra.hands_to_death = math.max(card.ability.extra.hands_to_death - 1, 0)
    end
    if context.ante_change and context.ante_end and not context.blueprint then
      card.ability.extra.hands_to_death = card.ability.extra.hands_reset
    end
  end
}
