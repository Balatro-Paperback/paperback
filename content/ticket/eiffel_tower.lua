PB_UTIL.Ticket {
  key = "eiffel_tower",
  atlas = "tickets_atlas",
  pos = { x = 6, y = 0 },
  stages = {
    { x = 3, y = 0 },
    { x = 4, y = 0 },
    { x = 5, y = 0 }
  },
  config = {
    extra = {
      faces_needed = 3,
      faces_destroyed = 0,
      enhancement = "m_steel",
      steels_needed = 9,
      steels_played = 0,
      food_jokers = 3,
      money_max = 50
    }
  },

  ticket_loc_vars = function(self, info_queue, card, focused_box)
    if focused_box == 2 then
      info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.extra.enhancement]
    end

    return {
      vars = {
        card.ability.extra.money_max,
        card.ability.extra.faces_needed,
        card.ability.extra.faces_destroyed,
        card.ability.extra.steels_needed,
        card.ability.extra.steels_played,
        localize { type = 'name_text', set = 'Enhanced', key = card.ability.extra.enhancement },
        card.ability.extra.food_jokers,
        G.GAME.paperback.food_jokers_purchased,
      }
    }
  end,

  ticket_set_ability = function(self, card, initial, delay_sprites)
    if G.GAME.paperback.food_jokers_purchased >= card.ability.extra.food_jokers then
      self:complete_stage(card, 3, true)
    end
  end,

  calculate = function(self, card, context)
    if context.blueprint then return end

    if context.remove_playing_cards then
      for _, v in ipairs(context.removed) do
        if v:is_face() then
          card.ability.extra.faces_destroyed = card.ability.extra.faces_destroyed + 1

          if card.ability.extra.faces_destroyed >= card.ability.extra.faces_needed then
            self:complete_stage(card, 1)
            break
          end
        end
      end
    end

    if context.before then
      for _, v in ipairs(context.full_hand) do
        if SMODS.has_enhancement(v, card.ability.extra.enhancement) then
          card.ability.extra.steels_played = card.ability.extra.steels_played + 1

          if card.ability.extra.steels_played >= card.ability.extra.steels_needed then
            self:complete_stage(card, 2)
            break
          end
        end
      end
    end

    if context.buying_card then
      G.E_MANAGER:add_event(Event {
        func = function()
          if G.GAME.paperback.food_jokers_purchased >= card.ability.extra.food_jokers then
            self:complete_stage(card, 3, nil, true)
          end
          return true
        end
      })
    end
  end,

  can_use = function(self, card)
    local without_edition = 0

    for _, v in ipairs(G.jokers.cards) do
      if not v.edition then
        without_edition = without_edition + 1
      end
    end

    return without_edition > 0 and card.ability.extra.ticket.stage == 3
  end,

  use = function(self, card, area, copier)
    for _, joker in ipairs(G.jokers.cards) do
      if not joker.edition then
        -- if no edition, give it a random one
        joker:set_edition(SMODS.poll_edition {
          guaranteed = true,
          key = 'eiffel_tower_edition'
        })
      else
        -- otherwise double money (max 50)
        ease_dollars(math.min(card.ability.extra.money_max, G.GAME.dollars))
      end
    end
  end
}
