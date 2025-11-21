SMODS.Joker {
  key = 'penumbra_phantasm',
  config = {
    extra = {
      mult = 0,
      a_mult = 1,
    }
  },
  rarity = 2,
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
  in_pool = function(self, args)
    for _, v in ipairs(G.playing_cards or {}) do
      if SMODS.has_no_rank(v) then return true end
    end
  end,

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

    -- Upgrade this Joker for every scored rankless card
    if not context.blueprint and context.individual and context.cardarea == G.play then
      if SMODS.has_no_rank(context.other_card) then
        card.ability.extra.scored = true
        card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.a_mult

        return {
          extra = {
            focus = card,
            message = localize {
              type = 'variable',
              key = 'a_mult',
              vars = { card.ability.extra.mult },
              colour = G.C.MULT,
            },
            card = card
          }
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
