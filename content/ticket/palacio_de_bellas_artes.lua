PB_UTIL.Ticket {
  key = "palacio_de_bellas_artes",
  atlas = "tickets_atlas",
  pos = { x = 6, y = 0 },
  stages = {
    { x = 0, y = 1 },
    { x = 1, y = 1 },
    { x = 2, y = 1 }
  },
  config = {
    extra = {
      rarities = {
        "Common",
        "Uncommon",
        "Rare"
      },
      enhancement = 'm_glass',
      glass_needed = 5,
      glass_scored = 0,
      vouchers = 3,
      joker_slots = 1,
    }
  },

  ticket_loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.extra.enhancement]

    return {
      vars = {
        card.ability.extra.joker_slots,
        card.ability.extra.glass_needed,
        localize {
          type = 'name_text',
          set = "Enhanced",
          key = card.ability.extra.enhancement
        },
        card.ability.extra.glass_scored,
        card.ability.extra.vouchers,
        PB_UTIL.get_vouchers_used(),
      }
    }
  end,

  calculate = function(self, card, context)
    if context.blueprint then return end

    if context.beat_boss then
      local has_needed_rarities = true

      for _, rarity in ipairs(card.ability.extra.rarities) do
        local has_rarity = false

        for _, joker in ipairs(G.jokers.cards) do
          if joker:is_rarity(rarity) then
            has_rarity = true
            break
          end
        end

        has_needed_rarities = has_needed_rarities and has_rarity
      end

      if has_needed_rarities then
        self:complete_stage(card, 1)
      end
    end

    if context.individual and context.cardarea == G.play then
      if SMODS.has_enhancement(context.other_card, card.ability.extra.enhancement) then
        card.ability.extra.glass_scored = card.ability.extra.glass_scored + 1

        if card.ability.extra.glass_scored >= card.ability.extra.glass_needed then
          self:complete_stage(card, 2)
        end
      end
    end

    if context.buying_card and context.card.ability.set == "Voucher" then
      if PB_UTIL.get_vouchers_used() >= card.ability.extra.vouchers then
        self:complete_stage(card, 3)
      end
    end
  end,

  ticket_complete_all = function(self, card)
    G.jokers.config.card_limit = G.jokers.config.card_limit + card.ability.extra.joker_slots

    SMODS.calculate_effect({
      message = localize('k_active_ex'),
      colour = G.C.PAPERBACK_TICKET
    }, card)
  end,

  remove_from_deck = function(self, card, from_debuff)
    if card.ability.extra.ticket.stage >= 3 and not from_debuff then
      G.jokers.config.card_limit = G.jokers.config.card_limit - card.ability.extra.joker_slots
    end
  end
}
