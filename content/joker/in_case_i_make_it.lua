SMODS.Joker {
  key = "in_case_i_make_it",
  config = {
    extra = {
      a_pchips = 10,
    }
  },
  pools = {
    Music = true
  },
  rarity = 2,
  pos = { x = 18, y = 2 },
  atlas = "jokers_atlas",
  cost = 5,
  unlocked = true,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,

  in_pool = function(self, args)
    if G.deck then
      for _, v in ipairs(G.deck.cards) do
        if SMODS.has_no_rank(v) then
          return true
        end
      end
    end
    return false
  end,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.a_pchips
      },
    }
  end,

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      if SMODS.has_enhancement(context.other_card, 'm_stone') or SMODS.has_no_rank(context.other_card) then
        context.other_card.ability.perma_bonus = (context.other_card.ability.perma_bonus or
          0) + card.ability.extra.a_pchips
        return {
          message = localize('k_upgrade_ex')
        }
      end
    end
  end
}
