SMODS.Sound {
  key = 'der-freischutz-fire',
  path = 'der-freischutz-fire.ogg',
}

SMODS.Joker {
  key = "der_freischutz",
  config = {
    extra = {
      max = 6,
      current = 0,
    },
  },
  attributes = {
    'rank',
    'seven',
    'destroy_card',
    'full_deck',
    'secret'
  },
  rarity = 2,
  pos = { x = 14, y = 4 },
  atlas = "jokers_atlas",
  cost = 6,
  unlocked = false,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,
  soul_pos = nil,
  paperback_credit = {
    coder = { 'vitellary' },
  },

  loc_vars = function(self, info_queue, card)
    return { vars = { math.min(card.ability.extra.current, card.ability.extra.max), card.ability.extra.max } }
  end,

  locked_loc_vars = function (self, info_queue, card)
    return { vars = { 7 }}
  end,

  check_for_unlock = function (self, args)
    return G.GAME.paperback.destroyed_faces >= 7
  end,

  calculate = function(self, card, context)
    if context.after and context.cardarea == G.jokers then
      local active = true
      for _, v in ipairs(context.scoring_hand) do
        if not PB_UTIL.is_rank(v, "7") then
          active = false
          break
        end
      end
      if active then
        if not context.blueprint then
          card.ability.extra.current = card.ability.extra.current + 1
        end
        if card.ability.extra.current <= card.ability.extra.max then
          local targets = {}
          local lowest_chips = math.huge -- lol
          for _, v in ipairs(G.playing_cards) do
            local chips = v:get_chip_bonus()
            if chips < lowest_chips then
              targets = {}
              lowest_chips = chips
            end
            if chips == lowest_chips then
              table.insert(targets, v)
            end
          end
          local target = pseudorandom_element(targets, pseudoseed('freischutz'))
          SMODS.destroy_cards({ target })
          if card.ability.extra.current == card.ability.extra.max then
            juice_card_until(card, function()
              return not (card.ability.extra.current < card.ability.extra.max)
            end, true, 0.5)
          end
          return {
            message = localize('paperback_destroyed_ex')
          }
        elseif not context.blueprint then
          card.ability.extra.current = 0

          G.E_MANAGER:add_event(Event({
            func = function()
              for _, card in ipairs(G.hand.cards) do
                SMODS.destroy_cards({ card })
              end
              play_sound("paperback_der-freischutz-fire")
              return true
            end
          }))

          return {
            message = localize('paperback_der_freischutz_fire'),
            delay = 0.8,
          }
        end
      end
    end
  end
}
