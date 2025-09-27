SMODS.Joker { -- Guns Blazin'
  key = "guns_blazin",
  config = {
    extra = {
      xmult = 1.5,
    }
  },
  pos = {
    x = 15,
    y = 4
  },
  cost = 8,
  rarity = 2,
  blueprint_compat = true,
  eternal_compat = true,
  unlocked = true,
  discovered = false,
  atlas = 'jokers_atlas',
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.xmult } }
  end,

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      if context.other_card:get_id() == 14 then
        return {
          x_mult = card.ability.extra.xmult
        }
      end
    end
  end

}
