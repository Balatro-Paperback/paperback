SMODS.Joker {
  key = "solemn_lament",
  config = {
    extra = {
      x_mult_mod = 0.15,
      x_mult = 1,
      BGcolour = G.C.PAPERBACK_SOLEMN_WHITE
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
    if context.before and not context.blueprint then
      local suits = {
        dark  = 0,
        light = 0
      }
      print("checking normal cards")
      for _, v in ipairs(context.scoring_hand) do
        if not SMODS.has_any_suit(v) then
          if suits.dark == 0 and PB_UTIL.is_suit(v, 'dark') then
            suits.dark = 1
            print("found dark")
          else
            if suits.light == 0 and PB_UTIL.is_suit(v, 'light') then
              suits.light = 1
              print("found dark")
            end
          end
        end
      end

      print("checking wild cards")
      for _, v in ipairs(context.scoring_hand) do
        if SMODS.has_any_suit(v) then
          if suits.dark == 0 and PB_UTIL.is_suit(v, 'dark') then
            suits.dark = 1
            print("found dark")
          else
            if suits.light == 0 and PB_UTIL.is_suit(v, 'light') then
              suits.light = 1
              print("found dark")
            end
          end
        end
      end





      if suits.dark == 1 and suits.light == 1 then
        card.ability.extra.x_mult = card.ability.extra.x_mult + card.ability.extra.x_mult_mod
        if card.ability.extra.BGcolour == G.C.PAPERBACK_SOLEMN_WHITE then
          card.ability.extra.BGcolour = G.C.BLACK
          print("message is black")
        else
          card.ability.extra.BGcolour = G.C.PAPERBACK_SOLEMN_WHITE
          print("message is white")
        end
        return {
          message = "X" .. card.ability.extra.x_mult,
          colour = card.ability.extra.BGcolour
        }
      end
    end



    if context.joker_main then
      local suits = {
        dark  = 0,
        light = 0
      }
      return {
        x_mult = card.ability.extra.x_mult,
      }
    end
  end
}
