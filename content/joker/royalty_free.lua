SMODS.Joker {
  key = "royalty_free",
  config = {
    extra = {
      perma_bonus = 5,
      active = true
    }
  },
  pools = {
    Music = true
  },
  attributes = {
    'chips',
    'modify_card',
    'perma_bonus',
    'rank',
    'chips',
    'rank',
    'two',
    'three',
    'four',
    'five',
    'six',
    'seven',
    'eight',
    'nine',
    'ten',
    'red',
    'music'
  },
  rarity = 1,
  pos = { x = 10, y = 11 },
  atlas = "jokers_atlas",
  cost = 4,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,
  paperback = {

  },
  paperback_credit = {
    coder = { 'thermo' }
  },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.perma_bonus
      }
    }
  end,

  calculate = function(self, card, context)
    if context.before and card.ability.extra.active then
      for _, v in ipairs(context.scoring_hand) do
        if not v:is_face(false) then
          v.ability.perma_bonus = (v.ability.perma_bonus or 0) + 1
          if not context.blueprint_card then
            card.ability.extra.active = false
          end
          return {
            message = localize('k_upgrade_ex'),
            colour = G.C.ORANGE,
            message_card = v
          }
        end
      end
    end
    if context.end_of_round and context.main_eval and not card.ability.extra.active then
      card.ability.extra.active = true
    end
  end
}
