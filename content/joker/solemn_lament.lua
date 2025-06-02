SMODS.Joker {
  key = "solemn_lament",
  config = {
    extra = {
      x_mult_mod = 0.15,
      x_mult = 1,
      is_white = true
    }
  },
  rarity = 3,
  pos = { x = 3, y = 1 },
  atlas = "jokers_atlas",
  cost = 8,
  unlocked = true,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,
  soul_pos = nil,
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = PB_UTIL.suit_tooltip('dark')
    info_queue[#info_queue + 1] = PB_UTIL.suit_tooltip('light')

    return {
      vars = {
        card.ability.extra.x_mult_mod,
        card.ability.extra.x_mult

      }
    }
  end,

  -- check_for_unlock = function(self, args)
  --       Not implementable atm without custom args :(
  -- end,

  calculate = function(self, card, context)
    if context.before and not context.blueprint then
      local suits = {
        dark  = false,
        light = false
      }
      
      for _, v in ipairs(context.scoring_hand) do
        if not SMODS.has_any_suit(v) then
          if not suits.dark and PB_UTIL.is_suit(v, 'dark') then
            suits.dark = true
          else
            if not suits.light and PB_UTIL.is_suit(v, 'light') then
              suits.light = true
            end
          end
        end
      end

      for _, v in ipairs(context.scoring_hand) do
        if SMODS.has_any_suit(v) then
          if not suits.dark and PB_UTIL.is_suit(v, 'dark') then
            suits.dark = true
          else
            if not suits.light and PB_UTIL.is_suit(v, 'light') then
              suits.light = true
            end
          end
        end
      end

      if suits.dark and suits.light then
        local BGcolour
        card.ability.extra.x_mult = card.ability.extra.x_mult + card.ability.extra.x_mult_mod
        if card.ability.extra.is_white then
          BGcolour = G.C.BLACK
          card.ability.extra.is_white = false
        else
          BGcolour = G.C.PAPERBACK_SOLEMN_WHITE
          card.ability.extra.is_white = true
        end
        return {
          message = localize {
            type = 'variable',
            key = 'a_xmult',
            vars = { card.ability.extra.x_mult }
          },
          colour = BGcolour
        }
      end
    end

    if context.joker_main then
      return {
        x_mult = card.ability.extra.x_mult,
      }
    end
  end
}
