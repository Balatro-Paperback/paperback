PB_UTIL.Ticket {
  key = "the_pyramids",
  atlas = "tickets_atlas",
  pos = { x = 6, y = 0 },
  stages = {
    { x = 0, y = 0 },
    { x = 1, y = 0 },
    { x = 2, y = 0 }
  },
  config = {
    extra = {
      voucher = 'v_hieroglyph',
      enhancement = 'm_stone',
      required = 5,
      enhancement_face = 'm_gold',
      copies = 2
    }
  },

  ticket_loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.extra.voucher]
    info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.extra.enhancement]
    info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.extra.enhancement_face]

    return {
      vars = {
        localize { type = "name_text", set = "Voucher", key = card.ability.extra.voucher },
        card.ability.extra.required,
        localize { type = "name_text", set = "Enhanced", key = card.ability.extra.enhancement },
        localize { type = "name_text", set = "Enhanced", key = card.ability.extra.enhancement_face },
        card.ability.extra.copies
      }
    }
  end,

  ticket_set_ability = function(self, card)
    if G.GAME.used_vouchers[card.ability.extra.voucher] then
      self:complete_stage(card, 1, true)
    end
  end,

  calculate = function(self, card, context)
    if context.blueprint then return end

    if context.buying_card and context.card.config.center_key == card.ability.extra.voucher then
      self:complete_stage(card, 1)
    end

    if context.before then
      local amount = 0

      for _, v in ipairs(context.scoring_hand) do
        if SMODS.has_enhancement(v, card.ability.extra.enhancement) then
          amount = amount + 1
        end
      end

      if amount >= card.ability.extra.required then
        self:complete_stage(card, 2)
      end
    end

    if context.setting_ability and not context.unchanged then
      if context.new == card.ability.extra.enhancement_face and context.other_card:is_face() then
        self:complete_stage(card, 3)
      end
    end
  end,

  can_use = function(self, card)
    return card.ability.extra.ticket.stage == 3 and #G.jokers.highlighted == 1
  end,

  use = function(self, card, area, copier)
    local joker = G.jokers.highlighted[1]

    for i = 1, card.ability.extra.copies do
      local copy = SMODS.copy_card(joker)
      copy:set_edition('e_negative', true)
    end
  end
}
