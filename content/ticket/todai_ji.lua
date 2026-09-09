PB_UTIL.Ticket {
  key = "todai_ji",
  atlas = "tickets_atlas",
  pos = { x = 6, y = 0 },
  stages = {
    { x = 3, y = 1 },
    { x = 4, y = 1 },
    { x = 5, y = 1 }
  },
  config = {
    extra = {
      required = 7,
      count = { hands = 0, discards = 0 },

      enhancements = { 'm_steel', 'm_gold' },
      rank = "Jack",
      enhanced_jacks = 4,

      rarities = { 2, 3 },
      edition = 'e_negative',
      jokers = 2,

      blind_size = 0.5,
    }
  },

  ticket_loc_vars = function(self, info_queue, card, focused_box)
    if focused_box == 2 then
      info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.extra.enhancements[1]]
      info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.extra.enhancements[2]]
    end

    return {
      vars = {
        card.ability.extra.blind_size,
        card.ability.extra.count.hands,
        card.ability.extra.count.discards,
        card.ability.extra.required,
        card.ability.extra.enhanced_jacks,
        localize { type = "name_text", set = "Enhanced", key = card.ability.extra.enhancements[1] },
        localize { type = "name_text", set = "Enhanced", key = card.ability.extra.enhancements[2] },
        localize(card.ability.extra.rank, 'ranks'),
      }
    }
  end,

  ticket_set_ability = function(self, card)
    local count = 0
    if G.jokers then
      for k, v in ipairs(G.jokers.cards or {}) do
        if (v.config.center.rarity == card.ability.extra.rarities[1]) or (v.config.center.rarity == card.ability.extra.rarities[2]) then
          if v.edition and not v.edition.negative then
            count = count + 1
          end
        end
      end
      if count >= card.ability.extra.jokers then
        self:complete_stage(card, 3, true)
      end
    end
  end,

  calculate = function(self, card, context)
    if context.blueprint then return end

    -- Stage 1
    if context.press_play or context.pre_discard then
      if context.press_play then
        card.ability.extra.count.hands = card.ability.extra.count.hands + 1
      end
      if context.pre_discard then
        card.ability.extra.count.discards = card.ability.extra.count.discards + 1
      end

      if (card.ability.extra.count.discards >= card.ability.extra.required) and (card.ability.extra.count.hands >= card.ability.extra.required) then
        self:complete_stage(card, 1)
      end
    end

    -- Stage 2
    if context.after then
      local amount = 0
      for _, v in ipairs(context.full_hand) do
        if PB_UTIL.is_rank(v, card.ability.extra.rank) then
          if SMODS.has_enhancement(v, card.ability.extra.enhancements[1]) or SMODS.has_enhancement(v, card.ability.extra.enhancements[2]) then
            amount = amount + 1
          end
        end
      end

      if amount >= card.ability.extra.enhanced_jacks then
        self:complete_stage(card, 2)
      end
    end


    -- Stage 3
    if context.card_added or (context.paperback and context.paperback.changing_edition and (context.paperback.edition ~= 'e_negative')) then
      local count = 0
      for k, v in ipairs(G.jokers.cards or {}) do
        if (v.config.center.rarity == card.ability.extra.rarities[1]) or (v.config.center.rarity == card.ability.extra.rarities[2]) then
          if v.edition and not v.edition.negative then
            count = count + 1
          end
        end
      end
      if context.card then
        if (context.card.config.center.rarity == card.ability.extra.rarities[1]) or (context.card.config.center.rarity == card.ability.extra.rarities[2]) then
          if context.card.edition and not context.card.edition.negative then
            count = count + 1
          end
        end
        if count >= card.ability.extra.jokers then
          self:complete_stage(card, 3)
        end
      end
    end

    if card.ability.extra.ticket.stage == 3 and context.setting_blind and G.GAME.blind and G.GAME.blind.boss then
      return {
        xblind_size = card.ability.extra.blind_size
      }
    end
  end,
}
