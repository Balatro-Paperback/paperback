SMODS.Joker {
  key = "solemn_lament",
  config = {
    extra = {
      x_mult_mod = 0.25,
      x_mult = 1
    }
  },
  rarity = 3,
  pos = { x = 3, y = 1 },
  atlas = "jokers_atlas",
  cost = 8,
  unlocked = false,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,
  soul_pos = nil,
  paperback = {
    ignores_the_world = true
  },
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
    local light = false
    local dark = false
    if context.before and not context.blueprint then
      for _, v in ipairs(context.scoring_hand) do
        if not SMODS.has_any_suit(v) and PB_UTIL.is_suit(v, 'light') then
          light = true
          break
        end
      end
      for _, v in ipairs(context.scoring_hand) do
        if not SMODS.has_any_suit(v) and PB_UTIL.is_suit(v, 'dark') then
          dark = true
          break
        end
      end
      if light and dark then
        card.ability.extra.x_mult = card.ability.extra.x_mult + card.ability.extra.x_mult_mod
        return {
          message = "X" .. card.ability.extra.x_mult
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
