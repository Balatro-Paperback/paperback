SMODS.Joker {
  key = "56_leaf_clover",
  config = { extra = { active = false } },
  attributes = {
    'generation',
    'tag',
    'negative',
    'suit',
    'clubs',
    'boss_blind'
  },
  rarity = 2,
  pos = { x = 24, y = 3 },
  atlas = "jokers_atlas",
  cost = 6,
  unlocked = false,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,
  soul_pos = nil,
  paperback_credit = {
    coder = { 'vitellary' }
  },

  check_for_unlock = function (self, args)
    return G.GAME.paperback.suits_scored_this_run['Clubs'] and G.GAME.paperback.suits_scored_this_run['Clubs'] >= 56
  end,

  locked_loc_vars = function (self, info_queue, card)
    return {vars = {56, localize('Clubs', 'suits_plural'),}}
  end,

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_TAGS.tag_negative
    return {}
  end,

  calculate = function(self, card, context)
    if context.before and not context.blueprint then
      card.ability.extra.active = true
      for _, other in ipairs(context.scoring_hand) do
        if not other:is_suit('Clubs') then
          card.ability.extra.active = false
          break
        end
      end
    end
    if context.end_of_round and G.GAME.blind.boss and context.main_eval and card.ability.extra.active then
      PB_UTIL.add_tag('tag_negative')
      return { message = localize('paperback_plus_tag') }
    end
  end
}
