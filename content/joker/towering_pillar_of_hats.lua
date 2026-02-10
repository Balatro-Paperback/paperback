if PB_UTIL.should_load_spectrum_items() then
  SMODS.Joker {
    key = "towering_pillar_of_hats",
    config = {
      extra = {
        mult = 0,
        change = 1,
        divisor = 2,
        ranks = {"Jack", "Queen", "King"},
        suit = "paperback_Crowns"
      }
    },
    paperback = {
      requires_custom_suits = true,
      requires_spectrum_or_suit = true
    },
    paperback_credit = {
      coder = { 'thermo' }
    },
    rarity = 1,
    pos = { x = 23, y = 3 },
    atlas = "jokers_atlas",
    cost = 6,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    update_mult = function(self, card)
      if G.playing_cards then
        local rank_tally = 0
        for _, playing_card in ipairs(G.playing_cards) do
          if (PB_UTIL.is_rank(playing_card, card.ability.extra.ranks[1]) or
              PB_UTIL.is_rank(playing_card, card.ability.extra.ranks[2]) or
              PB_UTIL.is_rank(playing_card, card.ability.extra.ranks[3])) then
            rank_tally = rank_tally + 1 end
        end
        local change = math.floor(rank_tally / card.ability.extra.divisor) - card.ability.extra.mult
        if change ~= 0 then
          card.ability.extra.mult = math.floor(rank_tally / card.ability.extra.divisor)
        end
      end
    end,

    loc_vars = function(self, info_queue, card)
      return {
        vars = {
          card.ability.extra.change,
          card.ability.extra.mult,
          card.ability.extra.divisor,
          card.ability.extra.ranks[1],
          card.ability.extra.ranks[2],
          card.ability.extra.ranks[3],
          localize(card.ability.extra.suit, 'suits_plural')
        }
      }
    end,

    add_to_deck = function(self, card, from_debuff)
      self:update_mult(card)
    end,

    calculate = function(self, card, context)
      if context.remove_playing_cards or context.playing_card_added or context.change_rank and not context.blueprint then
        self:update_mult(card)
      end
      if context.individual and context.cardarea == G.play then
        if context.other_card:is_suit("paperback_Crowns") then
          return {
            mult = card.ability.extra.mult
          }
        end
      end
    end
  }
end
