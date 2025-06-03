SMODS.Joker {
  key = "one_sin_and_hundreds_of_good_deeds",
  rarity = 1,
  pos = { x = 7, y = 4 }, -- TODO: CHANGE WHEN SPRITE IS ADDED TO ATLAS
  atlas = "jokers_atlas",
  cost = 6,
  config = {
    extra = {
      mult = 3,
      fed = false,
      scaling = 1,
    }
  },
  unlocked = true,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,
  paperback = {
    requires_ranks = true
  },

  loc_vars = function(self, info_queue, card)
    if not card.ability.extra.fed then
      return {
        vars = {
          card.ability.extra.mult,
        }
      }
    else
      -- Changes desc and loc vars to the alternate ones if One Sin is fed
      return {
        vars = {
          card.ability.extra.scaling,
          card.ability.extra.scaling * (#G.deck.cards or 0)
        },
        key = "j_paperback_one_sin_and_hundreds_of_good_deeds_fed"
      }
    end
  end,

  in_pool = function(self, args)
    for _, v in ipairs(G.playing_cards or {}) do
      if v:get_id() == SMODS.Ranks['paperback_Apostle'].id then
        return true
      end
    end
  end,

  -- Changes name to the coloured one
  generate_ui = function(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
    full_UI_table.name = localize { type = 'name', set = "Joker",
      key = card.ability.extra.fed and "j_paperback_one_sin_and_hundreds_of_good_deeds_fed" or "j_paperback_one_sin_and_hundreds_of_good_deeds"
      , nodes = {}
    }
    return SMODS.Center.generate_ui(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
  end,

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      if SMODS.has_no_rank(context.other_card) or context.other_card:get_id() == 3 then
        if card.ability.extra.fed then
          if #G.deck.cards > 0 then
            return {
              mult = card.ability.extra.scaling * #G.deck.cards
            }
          end
        else
          return {
            mult = card.ability.extra.mult
          }
        end
      end
    end

    if context.before and SMODS.find_card('j_paperback_white_night', true) then
      local target = SMODS.find_card('j_paperback_white_night', true)[1]
      if #context.full_hand == 1 and context.full_hand[1]:get_id() == SMODS.Ranks['paperback_Apostle'].id then
        PB_UTIL.destroy_joker(target)
        card.ability.extra.fed = true
        return {
          message = localize('paperback_confessed_ex')
        }
      end
    end
  end
}
