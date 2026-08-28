SMODS.Joker {
  key = 'surfer',
  config = {
    extra = {
      chips = 0,
      a_chips_held = 10,
      rank = "10",
    }
  },
  attributes = {
    'chips',
    'scaling',
    'rank',
    'ten'
  },
  rarity = 2,
  pos = { x = 5, y = 10 },
  atlas = 'jokers_atlas',
  cost = 7,
  unlocked = false,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = false,

  paperback_credit = {
    coder = { 'oppositewolf' }
  },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.a_chips_held,
        localize(card.ability.extra.rank, 'ranks'),
        card.ability.extra.chips,
      }
    }
  end,

  locked_loc_vars = function(self, info_queue, card)
    return {
      vars = {
        10
      }
    }
  end,

  check_for_unlock = function(self, args)
    if args.type == 'paperback_convert_face_to_ten' then
      return true
    end
  end,

  calculate = function(self, card, context)
    -- Gains +10 chips for each 10 held in hand at end of round
    if context.end_of_round and context.individual and context.cardarea == G.hand and not context.blueprint then
      if PB_UTIL.is_rank(context.other_card, card.ability.extra.rank) then
        SMODS.scale_card(card, {
          ref_table = card.ability.extra,
          ref_value = 'chips',
          scalar_value = 'a_chips_held',
          scaling_message = {
            message = localize {
              type = 'variable',
              key = 'a_chips',
              vars = { card.ability.extra.a_chips_held }
            },
            colour = G.C.CHIPS,
            juice_card = context.other_card,
            message_card = card,
          }
        })
        return nil, true
      end
    end

    -- Give chips during scoring
    if context.joker_main then
      return {
        chips = card.ability.extra.chips
      }
    end
  end,

  joker_display_def = function(JokerDisplay)
    return {
      text = {
        { text = "+" },
        { ref_table = "card.ability.extra", ref_value = "chips", retrigger_type = "mult" }
      },
      text_config = { colour = G.C.CHIPS },
    }
  end,
}

-- Hook into both change_base and copy_card to account for both situations
local change_base_ref = SMODS.change_base
function SMODS.change_base(card, suit, rank, manual_sprites)
  if card:is_face() and rank == "10" then
    check_for_unlock({type = 'paperback_convert_face_to_ten'})
  end
  return change_base_ref(card, suit, rank, manual_sprites)
end

local copy_card_ref = copy_card
function copy_card(other, new_card, card_scale, playing_card, strip_edition)
  -- sanity checks because copying with debugplus results in new_card being nil
  if new_card and other then
    if new_card:is_face() and PB_UTIL.is_rank(other, 10) then
      check_for_unlock({type = 'paperback_convert_face_to_ten'})
    end
  end
  return copy_card_ref(other, new_card, card_scale, playing_card, strip_edition)
end