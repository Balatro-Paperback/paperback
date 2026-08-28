SMODS.Joker {
  key = "black_forest_cake",
  config = {
    extra = {
      mult = 2,
      a_mult = 2
    }
  },
  attributes = {
    'mult',
    'scaling',
    'food'
  },
  rarity = 1,
  pos = { x = 13, y = 10 },
  atlas = "jokers_atlas",
  cost = 3,
  unlocked = false,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = false,
  perishable_compat = false,
  soul_pos = nil,
  pools = {
    Food = true
  },
  paperback_credit = {
    coder = { 'ejwu' }
  },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.mult,
        card.ability.extra.a_mult,
      }
    }
  end,

  locked_loc_vars = function(self, info_queue, card)
    return { vars = {localize("Queen", 'ranks')} }
  end,

  check_for_unlock = function(self, args)
    -- we need to also check for G.GAME.round because the game decides to run this on every single card being added to the deck on run start
    if args.type == 'paperback_removed_playing_cards' or (args.type == 'modify_deck' and G.GAME.round >= 1) then
      for _, v in ipairs(G.playing_cards or {}) do
        if v:is_face() and not PB_UTIL.is_rank(v, 'Queen') then 
          return false
        end
      end
      --assume all non-queen face cards are gone, check to see if there are any queens in deck
      for _, v in ipairs(G.playing_cards or {}) do
        if PB_UTIL.is_rank(v, 'Queen') then 
          return true
        end
      end
    end
  end,

  calculate = function(self, card, context)
    if context.joker_main and card.ability.extra.mult > 0 then
      return {
        mult = card.ability.extra.mult,
      }
    end

    if not context.blueprint and context.end_of_round and context.main_eval then
      SMODS.scale_card(card, {
        ref_table = card.ability.extra,
        ref_value = 'mult',
        scalar_value = 'a_mult',
        message_colour = G.C.MULT
      })
      return nil, true
    end

    local count = PB_UTIL.count_destroyed_things(context)
    if not context.blueprint and count > 0 and not (context.joker_type_destroyed and context.card == card) then
      PB_UTIL.destroy_joker(card)
      return {
        message = localize('k_eaten_ex'),
        colour = G.C.FILTER
      }
    end
  end,

  joker_display_def = function(JokerDisplay)
    return {
      text = {
        { text = "+" },
        { ref_table = "card.ability.extra", ref_value = "mult", retrigger_type = "mult" }
      },
      text_config = { colour = G.C.MULT },
    }
  end,
}
