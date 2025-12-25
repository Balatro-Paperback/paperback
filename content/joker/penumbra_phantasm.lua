SMODS.Joker {
  key = 'penumbra_phantasm',
  config = {
    extra = {
      mult = 0,
      a_mult = 1,
    }
  },
  rarity = 3,
  pos = { x = 22, y = 2 },
  atlas = 'jokers_atlas',
  cost = 9,
  unlocked = true,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = false,
  pools = {
    Music = true
  },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.a_mult,
        card.ability.extra.mult,
      }
    }
  end,

  calculate = function(self, card, context)
    if context.joker_main and context.cardarea == G.jokers then
      return {
        mult = card.ability.extra.mult,
      }
    end

    if context.modify_scoring_hand and context.other_card:is_face() then
      return { add_to_hand = true }
    end

    -- Upgrade this Joker for every scored rankless card
    if not context.blueprint and context.individual and context.cardarea == G.play then
      if SMODS.has_no_rank(context.other_card) then
        card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.a_mult

        return {
          message = localize {
            type = 'variable',
            key = 'a_mult',
            vars = { card.ability.extra.mult },
            colour = G.C.MULT,
          },
          message_card = card
        }
      end
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

local has_no_rank_ref = SMODS.has_no_rank
function SMODS.has_no_rank(card)
  if card.paperback_penumbra_checking_face then
    return has_no_rank_ref(card)
  end
  if next(SMODS.find_card('j_paperback_penumbra_phantasm')) and card:is_face() then
    return true
  end
  return has_no_rank_ref(card)
end

local is_face_ref = Card.is_face
function Card:is_face(from_boss)
  self.paperback_penumbra_checking_face = true
  local ret = is_face_ref(self, from_boss)
  self.paperback_penumbra_checking_face = nil
  return ret
end
