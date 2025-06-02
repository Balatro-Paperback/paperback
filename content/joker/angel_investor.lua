SMODS.Joker {
  key = "angel_investor",
  config = {
    extra = {
      tags = 1
    }
  },
  rarity = 1,
  pos = { x = 7, y = 7 },
  atlas = 'jokers_atlas',
  cost = 4,
  unlocked = true,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,
  paperback = {
    requires_tags = true,
  },

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_TAGS.tag_paperback_angel_investment

    return {
      vars = {
        card.ability.extra.tags
      }
    }
  end,

  calculate = function(self, card, context)
    if context.skip_blind or (context.end_of_round and G.GAME.blind.boss and context.main_eval) then
      for i = 1, card.ability.extra.tags do
        -- Only play sound on the last tag
        PB_UTIL.add_tag('tag_paperback_angel_investment', nil, i < card.ability.extra.tags)
      end

      return {
        message = localize('paperback_investment_ex'),
        colour = G.C.MONEY
      }
    end
  end
}
